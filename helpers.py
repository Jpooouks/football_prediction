import sqlite3
from typing import Dict, List, Tuple


def get_database_keys(db_path: str) -> Dict[str, Dict[str, List[Tuple[str, str, int]]]]:
    """
    Retrieves the primary and foreign keys for all tables in a SQLite database.
    
    Parameters:
    - db_path (str): The file path to the SQLite database.

    Returns:
    - Dict[str, Dict[str, List[Tuple[str, str, int]]]]: A dictionary where each key is a table name.
      The value for each key is another dictionary with two keys: 'Primary Keys' and 'Foreign Keys'.
      'Primary Keys' is a list of column names that are primary keys in the table.
      'Foreign Keys' is a list of tuples, each containing the column name in the current table,
      the referenced table name, and the foreign key index.

    Example of return structure:
    {
        'TableName': {
            'Primary Keys': ['id'],
            'Foreign Keys': [('foreign_key_column', 'ReferencedTableName', 0)]
        },
        ...
    }
    """
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    cursor.execute("select name from sqlite_master where type='table';")
    tables = cursor.fetchall()
    
    keys_info: Dict[str, Dict[str, List[Tuple[str, str, int]]]] = {}

    for table_name in tables:
        table_name = table_name[0]
        keys_info[table_name] = {'Primary Keys': [], 'Foreign Keys': []}
        
        cursor.execute(f"pragma table_info({table_name});")
        columns = cursor.fetchall()
        for column in columns:
            if column[5]:
                keys_info[table_name]['Primary Keys'].append(column[1])
        
        cursor.execute(f"pragma foreign_key_list({table_name});")
        foreign_keys = cursor.fetchall()
        for fk in foreign_keys:
            keys_info[table_name]['Foreign Keys'].append((fk[3], fk[2], fk[0]))

    conn.close()
    
    return keys_info
