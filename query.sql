with 

team_team_attributes as 
(
    select 
        t.team_api_id, 
        t.team_long_name, 
        ta.date, 
        ta.buildUpPlaySpeed, ta.buildUpPlaySpeedClass, ta.buildUpPlayDribbling,
        ta.buildUpPlayDribblingClass, ta.buildUpPlayPassing, ta.buildUpPlayPassingClass, ta.buildUpPlayPositioningClass,
        ta.chanceCreationPassing, ta.chanceCreationPassingClass, ta.chanceCreationCrossing, ta.chanceCreationCrossingClass,
        ta.chanceCreationShooting, ta.chanceCreationShootingClass, ta.chanceCreationPositioningClass, ta.defencePressure,
        ta.defencePressureClass, ta.defenceAggression, ta.defenceAggressionClass, ta.defenceTeamWidth, ta.defenceTeamWidthClass,
        ta.defenceDefenderLineClass
    from 
        team t
        left join team_attributes ta 
        on t.team_api_id = ta.team_api_id
), 

player_player_attributes as
(
    select p.player_name, p.birthday, p.height, p.weight,
           pa.*
        from player p 
        left join
        player_attributes pa
        on p.player_api_id = pa.player_api_id
),


ranked_attributes_home as 
(
    select 
        *,
        row_number() over (partition by team_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        team_team_attributes,
        (select distinct home_team_api_id, date as match_date from match) as unique_dates
    where 
        team_team_attributes.team_api_id = unique_dates.home_team_api_id
),

ranked_attributes_away as 
(
    select 
        *,
        row_number() over (partition by team_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        team_team_attributes,
        (select distinct away_team_api_id, date as match_date from match) as unique_dates
    where 
        team_team_attributes.team_api_id = unique_dates.away_team_api_id
),




ranked_player_1_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_1, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_1
),

ranked_player_2_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_2, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_2
),

ranked_player_3_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_3, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_3
),

ranked_player_4_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_4, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_4
),

ranked_player_5_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_5, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_5
),

ranked_player_6_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_6, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_6
),

ranked_player_7_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_7, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_7
),

ranked_player_8_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_8, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_8
),

ranked_player_9_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_9, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_9
),

ranked_player_10_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_10, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_10
),

ranked_player_11_attributes_home as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct home_player_11, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.home_player_11
),





ranked_player_1_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_1, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_1
),

ranked_player_2_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_2, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_2
), 

ranked_player_3_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_3, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_3
),

ranked_player_4_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_4, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_4
),

ranked_player_5_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_5, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_5
), 

ranked_player_6_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_6, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_6
),

ranked_player_7_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_7, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_7
),

ranked_player_8_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_8, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_8
),

ranked_player_9_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_9, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_9
),

ranked_player_10_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_10, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_10
),

ranked_player_11_attributes_away as 
(
    select 
        *,
        row_number() over (partition by player_api_id order by abs(julianday(date) - julianday(match_date)) asc) as date_rank
    from 
        player_player_attributes,
        (select distinct away_player_11, date as match_date from match) as unique_dates
    where 
        player_player_attributes.player_api_id = unique_dates.away_player_11
)




select 
    m.*,
    
    rta_home.team_long_name home_team,
    rta_home.date home_date,
    rta_home.buildUpPlaySpeed home_buildUpPlaySpeed,
    rta_home.buildUpPlaySpeedClass home_buildUpPlaySpeedClass,
    rta_home.buildUpPlayDribbling home_buildUpPlayDribbling,
    rta_home.buildUpPlayDribblingClass home_buildUpPlayDribblingClass,
    rta_home.buildUpPlayPassing home_buildUpPlayPassing,
    rta_home.buildUpPlayPassingClass home_buildUpPlayPassingClass,
    rta_home.buildUpPlayPositioningClass home_buildUpPlayPositioningClass,
    rta_home.chanceCreationPassing home_chanceCreationPassing,
    rta_home.chanceCreationPassingClass home_chanceCreationPassingClass,
    rta_home.chanceCreationCrossing home_chanceCreationCrossing,
    rta_home.chanceCreationCrossingClass home_chanceCreationCrossingClass,
    rta_home.chanceCreationShooting home_chanceCreationShooting,
    rta_home.chanceCreationShootingClass home_chanceCreationShootingClass,
    rta_home.chanceCreationPositioningClass home_chanceCreationPositioningClass,
    rta_home.defencePressure home_defencePressure,
    rta_home.defencePressureClass home_defencePressureClass,
    rta_home.defenceAggression home_defenceAggression,
    rta_home.defenceAggressionClass home_defenceAggressionClass,
    rta_home.defenceTeamWidth home_defenceTeamWidth,
    rta_home.defenceTeamWidthClass home_defenceTeamWidthClass,
    rta_home.defenceDefenderLineClass home_defenceDefenderLineClass,
    
    rta_away.date away_date,
    rta_away.team_long_name away_team,
    rta_away.buildUpPlaySpeed away_buildUpPlaySpeed,
    rta_away.buildUpPlaySpeedClass away_buildUpPlaySpeedClass,
    rta_away.buildUpPlayDribbling away_buildUpPlayDribbling,
    rta_away.buildUpPlayDribblingClass away_buildUpPlayDribblingClass,
    rta_away.buildUpPlayPassing away_buildUpPlayPassing,
    rta_away.buildUpPlayPassingClass away_buildUpPlayPassingClass,
    rta_away.buildUpPlayPositioningClass away_buildUpPlayPositioningClass,
    rta_away.chanceCreationPassing away_chanceCreationPassing,
    rta_away.chanceCreationPassingClass away_chanceCreationPassingClass,
    rta_away.chanceCreationCrossing away_chanceCreationCrossing,
    rta_away.chanceCreationCrossingClass away_chanceCreationCrossingClass,
    rta_away.chanceCreationShooting away_chanceCreationShooting,
    rta_away.chanceCreationShootingClass away_chanceCreationShootingClass,
    rta_away.chanceCreationPositioningClass away_chanceCreationPositioningClass,
    rta_away.defencePressure away_defencePressure,
    rta_away.defencePressureClass away_defencePressureClass,
    rta_away.defenceAggression away_defenceAggression,
    rta_away.defenceAggressionClass away_defenceAggressionClass,
    rta_away.defenceTeamWidth away_defenceTeamWidth,
    rta_away.defenceTeamWidthClass away_defenceTeamWidthClass,
    rta_away.defenceDefenderLineClass away_defenceDefenderLineClass,

    rpah1.player_name home_player_1_name,
    rpah1.birthday home_player_1_birthday,
    rpah1.height home_player_1_height,
    rpah1.weight home_player_1_weight,
    rpah1.overall_rating home_player_1_overall_rating,
    rpah1.potential home_player_1_potential,
    rpah1.preferred_foot home_player_1_preferred_foot,
    rpah1.attacking_work_rate home_player_1_attacking_work_rate,
    rpah1.defensive_work_rate home_player_1_defensive_work_rate,
    rpah1.crossing home_player_1_crossing,
    rpah1.finishing home_player_1_finishing,
    rpah1.heading_accuracy home_player_1_heading_accuracy,
    rpah1.short_passing home_player_1_short_passing,
    rpah1.volleys home_player_1_volleys,
    rpah1.dribbling home_player_1_dribbling,
    rpah1.curve home_player_1_curve,
    rpah1.free_kick_accuracy home_player_1_free_kick_accuracy,
    rpah1.long_passing home_player_1_long_passing,
    rpah1.ball_control home_player_1_ball_control,
    rpah1.acceleration home_player_1_acceleration,
    rpah1.sprint_speed home_player_1_sprint_speed,
    rpah1.agility home_player_1_agility,
    rpah1.reactions home_player_1_reactions,
    rpah1.balance home_player_1_balance,
    rpah1.shot_power home_player_1_shot_power,
    rpah1.jumping home_player_1_jumping,
    rpah1.stamina home_player_1_stamina,
    rpah1.strength home_player_1_strength,
    rpah1.long_shots home_player_1_long_shots,
    rpah1.aggression home_player_1_aggression,
    rpah1.interceptions home_player_1_interceptions,
    rpah1.positioning home_player_1_positioning,
    rpah1.vision home_player_1_vision,
    rpah1.penalties home_player_1_penalties,
    rpah1.marking home_player_1_marking,
    rpah1.standing_tackle home_player_1_standing_tackle,
    rpah1.sliding_tackle home_player_1_sliding_tackle,
    rpah1.gk_diving home_player_1_gk_diving,
    rpah1.gk_handling home_player_1_gk_handling,
    rpah1.gk_kicking home_player_1_gk_kicking,
    rpah1.gk_positioning home_player_1_gk_positioning,
    rpah1.gk_reflexes home_player_1_gk_reflexes,
    
    rpah2.player_name home_player_2_name,
    rpah2.birthday home_player_2_birthday,
    rpah2.height home_player_2_height,
    rpah2.weight home_player_2_weight,
    rpah2.overall_rating home_player_2_overall_rating,
    rpah2.potential home_player_2_potential,
    rpah2.preferred_foot home_player_2_preferred_foot,
    rpah2.attacking_work_rate home_player_2_attacking_work_rate,
    rpah2.defensive_work_rate home_player_2_defensive_work_rate,
    rpah2.crossing home_player_2_crossing,
    rpah2.finishing home_player_2_finishing,
    rpah2.heading_accuracy home_player_2_heading_accuracy,
    rpah2.short_passing home_player_2_short_passing,
    rpah2.volleys home_player_2_volleys,
    rpah2.dribbling home_player_2_dribbling,
    rpah2.curve home_player_2_curve,
    rpah2.free_kick_accuracy home_player_2_free_kick_accuracy,
    rpah2.long_passing home_player_2_long_passing,
    rpah2.ball_control home_player_2_ball_control,
    rpah2.acceleration home_player_2_acceleration,
    rpah2.sprint_speed home_player_2_sprint_speed,
    rpah2.agility home_player_2_agility,
    rpah2.reactions home_player_2_reactions,
    rpah2.balance home_player_2_balance,
    rpah2.shot_power home_player_2_shot_power,
    rpah2.jumping home_player_2_jumping,
    rpah2.stamina home_player_2_stamina,
    rpah2.strength home_player_2_strength,
    rpah2.long_shots home_player_2_long_shots,
    rpah2.aggression home_player_2_aggression,
    rpah2.interceptions home_player_2_interceptions,
    rpah2.positioning home_player_2_positioning,
    rpah2.vision home_player_2_vision,
    rpah2.penalties home_player_2_penalties,
    rpah2.marking home_player_2_marking,
    rpah2.standing_tackle home_player_2_standing_tackle,
    rpah2.sliding_tackle home_player_2_sliding_tackle,
    rpah2.gk_diving home_player_2_gk_diving,
    rpah2.gk_handling home_player_2_gk_handling,
    rpah2.gk_kicking home_player_2_gk_kicking,
    rpah2.gk_positioning home_player_2_gk_positioning,
    rpah2.gk_reflexes home_player_2_gk_reflexes,
    
    rpah3.player_name home_player_3_name,
    rpah3.birthday home_player_3_birthday,
    rpah3.height home_player_3_height,
    rpah3.weight home_player_3_weight,
    rpah3.overall_rating home_player_3_overall_rating,
    rpah3.potential home_player_3_potential,
    rpah3.preferred_foot home_player_3_preferred_foot,
    rpah3.attacking_work_rate home_player_3_attacking_work_rate,
    rpah3.defensive_work_rate home_player_3_defensive_work_rate,
    rpah3.crossing home_player_3_crossing,
    rpah3.finishing home_player_3_finishing,
    rpah3.heading_accuracy home_player_3_heading_accuracy,
    rpah3.short_passing home_player_3_short_passing,
    rpah3.volleys home_player_3_volleys,
    rpah3.dribbling home_player_3_dribbling,
    rpah3.curve home_player_3_curve,
    rpah3.free_kick_accuracy home_player_3_free_kick_accuracy,
    rpah3.long_passing home_player_3_long_passing,
    rpah3.ball_control home_player_3_ball_control,
    rpah3.acceleration home_player_3_acceleration,
    rpah3.sprint_speed home_player_3_sprint_speed,
    rpah3.agility home_player_3_agility,
    rpah3.reactions home_player_3_reactions,
    rpah3.balance home_player_3_balance,
    rpah3.shot_power home_player_3_shot_power,
    rpah3.jumping home_player_3_jumping,
    rpah3.stamina home_player_3_stamina,
    rpah3.strength home_player_3_strength,
    rpah3.long_shots home_player_3_long_shots,
    rpah3.aggression home_player_3_aggression,
    rpah3.interceptions home_player_3_interceptions,
    rpah3.positioning home_player_3_positioning,
    rpah3.vision home_player_3_vision,
    rpah3.penalties home_player_3_penalties,
    rpah3.marking home_player_3_marking,
    rpah3.standing_tackle home_player_3_standing_tackle,
    rpah3.sliding_tackle home_player_3_sliding_tackle,
    rpah3.gk_diving home_player_3_gk_diving,
    rpah3.gk_handling home_player_3_gk_handling,
    rpah3.gk_kicking home_player_3_gk_kicking,
    rpah3.gk_positioning home_player_3_gk_positioning,
    rpah3.gk_reflexes home_player_3_gk_reflexes,
    
    rpah4.player_name home_player_4_name,
    rpah4.birthday home_player_4_birthday,
    rpah4.height home_player_4_height,
    rpah4.weight home_player_4_weight,
    rpah4.overall_rating home_player_4_overall_rating,
    rpah4.potential home_player_4_potential,
    rpah4.preferred_foot home_player_4_preferred_foot,
    rpah4.attacking_work_rate home_player_4_attacking_work_rate,
    rpah4.defensive_work_rate home_player_4_defensive_work_rate,
    rpah4.crossing home_player_4_crossing,
    rpah4.finishing home_player_4_finishing,
    rpah4.heading_accuracy home_player_4_heading_accuracy,
    rpah4.short_passing home_player_4_short_passing,
    rpah4.volleys home_player_4_volleys,
    rpah4.dribbling home_player_4_dribbling,
    rpah4.curve home_player_4_curve,
    rpah4.free_kick_accuracy home_player_4_free_kick_accuracy,
    rpah4.long_passing home_player_4_long_passing,
    rpah4.ball_control home_player_4_ball_control,
    rpah4.acceleration home_player_4_acceleration,
    rpah4.sprint_speed home_player_4_sprint_speed,
    rpah4.agility home_player_4_agility,
    rpah4.reactions home_player_4_reactions,
    rpah4.balance home_player_4_balance,
    rpah4.shot_power home_player_4_shot_power,
    rpah4.jumping home_player_4_jumping,
    rpah4.stamina home_player_4_stamina,
    rpah4.strength home_player_4_strength,
    rpah4.long_shots home_player_4_long_shots,
    rpah4.aggression home_player_4_aggression,
    rpah4.interceptions home_player_4_interceptions,
    rpah4.positioning home_player_4_positioning,
    rpah4.vision home_player_4_vision,
    rpah4.penalties home_player_4_penalties,
    rpah4.marking home_player_4_marking,
    rpah4.standing_tackle home_player_4_standing_tackle,
    rpah4.sliding_tackle home_player_4_sliding_tackle,
    rpah4.gk_diving home_player_4_gk_diving,
    rpah4.gk_handling home_player_4_gk_handling,
    rpah4.gk_kicking home_player_4_gk_kicking,
    rpah4.gk_positioning home_player_4_gk_positioning,
    rpah4.gk_reflexes home_player_4_gk_reflexes,
    
    rpah5.player_name home_player_5_name,
    rpah5.birthday home_player_5_birthday,
    rpah5.height home_player_5_height,
    rpah5.weight home_player_5_weight,
    rpah5.overall_rating home_player_5_overall_rating,
    rpah5.potential home_player_5_potential,
    rpah5.preferred_foot home_player_5_preferred_foot,
    rpah5.attacking_work_rate home_player_5_attacking_work_rate,
    rpah5.defensive_work_rate home_player_5_defensive_work_rate,
    rpah5.crossing home_player_5_crossing,
    rpah5.finishing home_player_5_finishing,
    rpah5.heading_accuracy home_player_5_heading_accuracy,
    rpah5.short_passing home_player_5_short_passing,
    rpah5.volleys home_player_5_volleys,
    rpah5.dribbling home_player_5_dribbling,
    rpah5.curve home_player_5_curve,
    rpah5.free_kick_accuracy home_player_5_free_kick_accuracy,
    rpah5.long_passing home_player_5_long_passing,
    rpah5.ball_control home_player_5_ball_control,
    rpah5.acceleration home_player_5_acceleration,
    rpah5.sprint_speed home_player_5_sprint_speed,
    rpah5.agility home_player_5_agility,
    rpah5.reactions home_player_5_reactions,
    rpah5.balance home_player_5_balance,
    rpah5.shot_power home_player_5_shot_power,
    rpah5.jumping home_player_5_jumping,
    rpah5.stamina home_player_5_stamina,
    rpah5.strength home_player_5_strength,
    rpah5.long_shots home_player_5_long_shots,
    rpah5.aggression home_player_5_aggression,
    rpah5.interceptions home_player_5_interceptions,
    rpah5.positioning home_player_5_positioning,
    rpah5.vision home_player_5_vision,
    rpah5.penalties home_player_5_penalties,
    rpah5.marking home_player_5_marking,
    rpah5.standing_tackle home_player_5_standing_tackle,
    rpah5.sliding_tackle home_player_5_sliding_tackle,
    rpah5.gk_diving home_player_5_gk_diving,
    rpah5.gk_handling home_player_5_gk_handling,
    rpah5.gk_kicking home_player_5_gk_kicking,
    rpah5.gk_positioning home_player_5_gk_positioning,
    rpah5.gk_reflexes home_player_5_gk_reflexes,
    
    rpah6.player_name home_player_6_name,
    rpah6.birthday home_player_6_birthday,
    rpah6.height home_player_6_height,
    rpah6.weight home_player_6_weight,
    rpah6.overall_rating home_player_6_overall_rating,
    rpah6.potential home_player_6_potential,
    rpah6.preferred_foot home_player_6_preferred_foot,
    rpah6.attacking_work_rate home_player_6_attacking_work_rate,
    rpah6.defensive_work_rate home_player_6_defensive_work_rate,
    rpah6.crossing home_player_6_crossing,
    rpah6.finishing home_player_6_finishing,
    rpah6.heading_accuracy home_player_6_heading_accuracy,
    rpah6.short_passing home_player_6_short_passing,
    rpah6.volleys home_player_6_volleys,
    rpah6.dribbling home_player_6_dribbling,
    rpah6.curve home_player_6_curve,
    rpah6.free_kick_accuracy home_player_6_free_kick_accuracy,
    rpah6.long_passing home_player_6_long_passing,
    rpah6.ball_control home_player_6_ball_control,
    rpah6.acceleration home_player_6_acceleration,
    rpah6.sprint_speed home_player_6_sprint_speed,
    rpah6.agility home_player_6_agility,
    rpah6.reactions home_player_6_reactions,
    rpah6.balance home_player_6_balance,
    rpah6.shot_power home_player_6_shot_power,
    rpah6.jumping home_player_6_jumping,
    rpah6.stamina home_player_6_stamina,
    rpah6.strength home_player_6_strength,
    rpah6.long_shots home_player_6_long_shots,
    rpah6.aggression home_player_6_aggression,
    rpah6.interceptions home_player_6_interceptions,
    rpah6.positioning home_player_6_positioning,
    rpah6.vision home_player_6_vision,
    rpah6.penalties home_player_6_penalties,
    rpah6.marking home_player_6_marking,
    rpah6.standing_tackle home_player_6_standing_tackle,
    rpah6.sliding_tackle home_player_6_sliding_tackle,
    rpah6.gk_diving home_player_6_gk_diving,
    rpah6.gk_handling home_player_6_gk_handling,
    rpah6.gk_kicking home_player_6_gk_kicking,
    rpah6.gk_positioning home_player_6_gk_positioning,
    rpah6.gk_reflexes home_player_6_gk_reflexes,
    
    rpah7.player_name home_player_7_name,
    rpah7.birthday home_player_7_birthday,
    rpah7.height home_player_7_height,
    rpah7.weight home_player_7_weight,
    rpah7.overall_rating home_player_7_overall_rating,
    rpah7.potential home_player_7_potential,
    rpah7.preferred_foot home_player_7_preferred_foot,
    rpah7.attacking_work_rate home_player_7_attacking_work_rate,
    rpah7.defensive_work_rate home_player_7_defensive_work_rate,
    rpah7.crossing home_player_7_crossing,
    rpah7.finishing home_player_7_finishing,
    rpah7.heading_accuracy home_player_7_heading_accuracy,
    rpah7.short_passing home_player_7_short_passing,
    rpah7.volleys home_player_7_volleys,
    rpah7.dribbling home_player_7_dribbling,
    rpah7.curve home_player_7_curve,
    rpah7.free_kick_accuracy home_player_7_free_kick_accuracy,
    rpah7.long_passing home_player_7_long_passing,
    rpah7.ball_control home_player_7_ball_control,
    rpah7.acceleration home_player_7_acceleration,
    rpah7.sprint_speed home_player_7_sprint_speed,
    rpah7.agility home_player_7_agility,
    rpah7.reactions home_player_7_reactions,
    rpah7.balance home_player_7_balance,
    rpah7.shot_power home_player_7_shot_power,
    rpah7.jumping home_player_7_jumping,
    rpah7.stamina home_player_7_stamina,
    rpah7.strength home_player_7_strength,
    rpah7.long_shots home_player_7_long_shots,
    rpah7.aggression home_player_7_aggression,
    rpah7.interceptions home_player_7_interceptions,
    rpah7.positioning home_player_7_positioning,
    rpah7.vision home_player_7_vision,
    rpah7.penalties home_player_7_penalties,
    rpah7.marking home_player_7_marking,
    rpah7.standing_tackle home_player_7_standing_tackle,
    rpah7.sliding_tackle home_player_7_sliding_tackle,
    rpah7.gk_diving home_player_7_gk_diving,
    rpah7.gk_handling home_player_7_gk_handling,
    rpah7.gk_kicking home_player_7_gk_kicking,
    rpah7.gk_positioning home_player_7_gk_positioning,
    rpah7.gk_reflexes home_player_7_gk_reflexes,
    
    rpah8.player_name home_player_8_name,
    rpah8.birthday home_player_8_birthday,
    rpah8.height home_player_8_height,
    rpah8.weight home_player_8_weight,
    rpah8.overall_rating home_player_8_overall_rating,
    rpah8.potential home_player_8_potential,
    rpah8.preferred_foot home_player_8_preferred_foot,
    rpah8.attacking_work_rate home_player_8_attacking_work_rate,
    rpah8.defensive_work_rate home_player_8_defensive_work_rate,
    rpah8.crossing home_player_8_crossing,
    rpah8.finishing home_player_8_finishing,
    rpah8.heading_accuracy home_player_8_heading_accuracy,
    rpah8.short_passing home_player_8_short_passing,
    rpah8.volleys home_player_8_volleys,
    rpah8.dribbling home_player_8_dribbling,
    rpah8.curve home_player_8_curve,
    rpah8.free_kick_accuracy home_player_8_free_kick_accuracy,
    rpah8.long_passing home_player_8_long_passing,
    rpah8.ball_control home_player_8_ball_control,
    rpah8.acceleration home_player_8_acceleration,
    rpah8.sprint_speed home_player_8_sprint_speed,
    rpah8.agility home_player_8_agility,
    rpah8.reactions home_player_8_reactions,
    rpah8.balance home_player_8_balance,
    rpah8.shot_power home_player_8_shot_power,
    rpah8.jumping home_player_8_jumping,
    rpah8.stamina home_player_8_stamina,
    rpah8.strength home_player_8_strength,
    rpah8.long_shots home_player_8_long_shots,
    rpah8.aggression home_player_8_aggression,
    rpah8.interceptions home_player_8_interceptions,
    rpah8.positioning home_player_8_positioning,
    rpah8.vision home_player_8_vision,
    rpah8.penalties home_player_8_penalties,
    rpah8.marking home_player_8_marking,
    rpah8.standing_tackle home_player_8_standing_tackle,
    rpah8.sliding_tackle home_player_8_sliding_tackle,
    rpah8.gk_diving home_player_8_gk_diving,
    rpah8.gk_handling home_player_8_gk_handling,
    rpah8.gk_kicking home_player_8_gk_kicking,
    rpah8.gk_positioning home_player_8_gk_positioning,
    rpah8.gk_reflexes home_player_8_gk_reflexes,
    
    rpah9.player_name home_player_9_name,
    rpah9.birthday home_player_9_birthday,
    rpah9.height home_player_9_height,
    rpah9.weight home_player_9_weight,
    rpah9.overall_rating home_player_9_overall_rating,
    rpah9.potential home_player_9_potential,
    rpah9.preferred_foot home_player_9_preferred_foot,
    rpah9.attacking_work_rate home_player_9_attacking_work_rate,
    rpah9.defensive_work_rate home_player_9_defensive_work_rate,
    rpah9.crossing home_player_9_crossing,
    rpah9.finishing home_player_9_finishing,
    rpah9.heading_accuracy home_player_9_heading_accuracy,
    rpah9.short_passing home_player_9_short_passing,
    rpah9.volleys home_player_9_volleys,
    rpah9.dribbling home_player_9_dribbling,
    rpah9.curve home_player_9_curve,
    rpah9.free_kick_accuracy home_player_9_free_kick_accuracy,
    rpah9.long_passing home_player_9_long_passing,
    rpah9.ball_control home_player_9_ball_control,
    rpah9.acceleration home_player_9_acceleration,
    rpah9.sprint_speed home_player_9_sprint_speed,
    rpah9.agility home_player_9_agility,
    rpah9.reactions home_player_9_reactions,
    rpah9.balance home_player_9_balance,
    rpah9.shot_power home_player_9_shot_power,
    rpah9.jumping home_player_9_jumping,
    rpah9.stamina home_player_9_stamina,
    rpah9.strength home_player_9_strength,
    rpah9.long_shots home_player_9_long_shots,
    rpah9.aggression home_player_9_aggression,
    rpah9.interceptions home_player_9_interceptions,
    rpah9.positioning home_player_9_positioning,
    rpah9.vision home_player_9_vision,
    rpah9.penalties home_player_9_penalties,
    rpah9.marking home_player_9_marking,
    rpah9.standing_tackle home_player_9_standing_tackle,
    rpah9.sliding_tackle home_player_9_sliding_tackle,
    rpah9.gk_diving home_player_9_gk_diving,
    rpah9.gk_handling home_player_9_gk_handling,
    rpah9.gk_kicking home_player_9_gk_kicking,
    rpah9.gk_positioning home_player_9_gk_positioning,
    rpah9.gk_reflexes home_player_9_gk_reflexes,
    
    rpah10.player_name home_player_10_name,
    rpah10.birthday home_player_10_birthday,
    rpah10.height home_player_10_height,
    rpah10.weight home_player_10_weight,
    rpah10.overall_rating home_player_10_overall_rating,
    rpah10.potential home_player_10_potential,
    rpah10.preferred_foot home_player_10_preferred_foot,
    rpah10.attacking_work_rate home_player_10_attacking_work_rate,
    rpah10.defensive_work_rate home_player_10_defensive_work_rate,
    rpah10.crossing home_player_10_crossing,
    rpah10.finishing home_player_10_finishing,
    rpah10.heading_accuracy home_player_10_heading_accuracy,
    rpah10.short_passing home_player_10_short_passing,
    rpah10.volleys home_player_10_volleys,
    rpah10.dribbling home_player_10_dribbling,
    rpah10.curve home_player_10_curve,
    rpah10.free_kick_accuracy home_player_10_free_kick_accuracy,
    rpah10.long_passing home_player_10_long_passing,
    rpah10.ball_control home_player_10_ball_control,
    rpah10.acceleration home_player_10_acceleration,
    rpah10.sprint_speed home_player_10_sprint_speed,
    rpah10.agility home_player_10_agility,
    rpah10.reactions home_player_10_reactions,
    rpah10.balance home_player_10_balance,
    rpah10.shot_power home_player_10_shot_power,
    rpah10.jumping home_player_10_jumping,
    rpah10.stamina home_player_10_stamina,
    rpah10.strength home_player_10_strength,
    rpah10.long_shots home_player_10_long_shots,
    rpah10.aggression home_player_10_aggression,
    rpah10.interceptions home_player_10_interceptions,
    rpah10.positioning home_player_10_positioning,
    rpah10.vision home_player_10_vision,
    rpah10.penalties home_player_10_penalties,
    rpah10.marking home_player_10_marking,
    rpah10.standing_tackle home_player_10_standing_tackle,
    rpah10.sliding_tackle home_player_10_sliding_tackle,
    rpah10.gk_diving home_player_10_gk_diving,
    rpah10.gk_handling home_player_10_gk_handling,
    rpah10.gk_kicking home_player_10_gk_kicking,
    rpah10.gk_positioning home_player_10_gk_positioning,
    rpah10.gk_reflexes home_player_10_gk_reflexes,
    
    rpah11.player_name home_player_11_name,
    rpah11.birthday home_player_11_birthday,
    rpah11.height home_player_11_height,
    rpah11.weight home_player_11_weight,
    rpah11.overall_rating home_player_11_overall_rating,
    rpah11.potential home_player_11_potential,
    rpah11.preferred_foot home_player_11_preferred_foot,
    rpah11.attacking_work_rate home_player_11_attacking_work_rate,
    rpah11.defensive_work_rate home_player_11_defensive_work_rate,
    rpah11.crossing home_player_11_crossing,
    rpah11.finishing home_player_11_finishing,
    rpah11.heading_accuracy home_player_11_heading_accuracy,
    rpah11.short_passing home_player_11_short_passing,
    rpah11.volleys home_player_11_volleys,
    rpah11.dribbling home_player_11_dribbling,
    rpah11.curve home_player_11_curve,
    rpah11.free_kick_accuracy home_player_11_free_kick_accuracy,
    rpah11.long_passing home_player_11_long_passing,
    rpah11.ball_control home_player_11_ball_control,
    rpah11.acceleration home_player_11_acceleration,
    rpah11.sprint_speed home_player_11_sprint_speed,
    rpah11.agility home_player_11_agility,
    rpah11.reactions home_player_11_reactions,
    rpah11.balance home_player_11_balance,
    rpah11.shot_power home_player_11_shot_power,
    rpah11.jumping home_player_11_jumping,
    rpah11.stamina home_player_11_stamina,
    rpah11.strength home_player_11_strength,
    rpah11.long_shots home_player_11_long_shots,
    rpah11.aggression home_player_11_aggression,
    rpah11.interceptions home_player_11_interceptions,
    rpah11.positioning home_player_11_positioning,
    rpah11.vision home_player_11_vision,
    rpah11.penalties home_player_11_penalties,
    rpah11.marking home_player_11_marking,
    rpah11.standing_tackle home_player_11_standing_tackle,
    rpah11.sliding_tackle home_player_11_sliding_tackle,
    rpah11.gk_diving home_player_11_gk_diving,
    rpah11.gk_handling home_player_11_gk_handling,
    rpah11.gk_kicking home_player_11_gk_kicking,
    rpah11.gk_positioning home_player_11_gk_positioning,
    rpah11.gk_reflexes home_player_11_gk_reflexes,


    rpaa1.player_name away_player_1_name,
    rpaa1.birthday away_player_1_birthday,
    rpaa1.height away_player_1_height,
    rpaa1.weight away_player_1_weight,
    rpaa1.overall_rating away_player_1_overall_rating,
    rpaa1.potential away_player_1_potential,
    rpaa1.preferred_foot away_player_1_preferred_foot,
    rpaa1.attacking_work_rate away_player_1_attacking_work_rate,
    rpaa1.defensive_work_rate away_player_1_defensive_work_rate,
    rpaa1.crossing away_player_1_crossing,
    rpaa1.finishing away_player_1_finishing,
    rpaa1.heading_accuracy away_player_1_heading_accuracy,
    rpaa1.short_passing away_player_1_short_passing,
    rpaa1.volleys away_player_1_volleys,
    rpaa1.dribbling away_player_1_dribbling,
    rpaa1.curve away_player_1_curve,
    rpaa1.free_kick_accuracy away_player_1_free_kick_accuracy,
    rpaa1.long_passing away_player_1_long_passing,
    rpaa1.ball_control away_player_1_ball_control,
    rpaa1.acceleration away_player_1_acceleration,
    rpaa1.sprint_speed away_player_1_sprint_speed,
    rpaa1.agility away_player_1_agility,
    rpaa1.reactions away_player_1_reactions,
    rpaa1.balance away_player_1_balance,
    rpaa1.shot_power away_player_1_shot_power,
    rpaa1.jumping away_player_1_jumping,
    rpaa1.stamina away_player_1_stamina,
    rpaa1.strength away_player_1_strength,
    rpaa1.long_shots away_player_1_long_shots,
    rpaa1.aggression away_player_1_aggression,
    rpaa1.interceptions away_player_1_interceptions,
    rpaa1.positioning away_player_1_positioning,
    rpaa1.vision away_player_1_vision,
    rpaa1.penalties away_player_1_penalties,
    rpaa1.marking away_player_1_marking,
    rpaa1.standing_tackle away_player_1_standing_tackle,
    rpaa1.sliding_tackle away_player_1_sliding_tackle,
    rpaa1.gk_diving away_player_1_gk_diving,
    rpaa1.gk_handling away_player_1_gk_handling,
    rpaa1.gk_kicking away_player_1_gk_kicking,
    rpaa1.gk_positioning away_player_1_gk_positioning,
    rpaa1.gk_reflexes away_player_1_gk_reflexes,
    
    rpaa2.player_name away_player_2_name,
    rpaa2.birthday away_player_2_birthday,
    rpaa2.height away_player_2_height,
    rpaa2.weight away_player_2_weight,
    rpaa2.overall_rating away_player_2_overall_rating,
    rpaa2.potential away_player_2_potential,
    rpaa2.preferred_foot away_player_2_preferred_foot,
    rpaa2.attacking_work_rate away_player_2_attacking_work_rate,
    rpaa2.defensive_work_rate away_player_2_defensive_work_rate,
    rpaa2.crossing away_player_2_crossing,
    rpaa2.finishing away_player_2_finishing,
    rpaa2.heading_accuracy away_player_2_heading_accuracy,
    rpaa2.short_passing away_player_2_short_passing,
    rpaa2.volleys away_player_2_volleys,
    rpaa2.dribbling away_player_2_dribbling,
    rpaa2.curve away_player_2_curve,
    rpaa2.free_kick_accuracy away_player_2_free_kick_accuracy,
    rpaa2.long_passing away_player_2_long_passing,
    rpaa2.ball_control away_player_2_ball_control,
    rpaa2.acceleration away_player_2_acceleration,
    rpaa2.sprint_speed away_player_2_sprint_speed,
    rpaa2.agility away_player_2_agility,
    rpaa2.reactions away_player_2_reactions,
    rpaa2.balance away_player_2_balance,
    rpaa2.shot_power away_player_2_shot_power,
    rpaa2.jumping away_player_2_jumping,
    rpaa2.stamina away_player_2_stamina,
    rpaa2.strength away_player_2_strength,
    rpaa2.long_shots away_player_2_long_shots,
    rpaa2.aggression away_player_2_aggression,
    rpaa2.interceptions away_player_2_interceptions,
    rpaa2.positioning away_player_2_positioning,
    rpaa2.vision away_player_2_vision,
    rpaa2.penalties away_player_2_penalties,
    rpaa2.marking away_player_2_marking,
    rpaa2.standing_tackle away_player_2_standing_tackle,
    rpaa2.sliding_tackle away_player_2_sliding_tackle,
    rpaa2.gk_diving away_player_2_gk_diving,
    rpaa2.gk_handling away_player_2_gk_handling,
    rpaa2.gk_kicking away_player_2_gk_kicking,
    rpaa2.gk_positioning away_player_2_gk_positioning,
    rpaa2.gk_reflexes away_player_2_gk_reflexes,
    
    rpaa3.player_name away_player_3_name,
    rpaa3.birthday away_player_3_birthday,
    rpaa3.height away_player_3_height,
    rpaa3.weight away_player_3_weight,
    rpaa3.overall_rating away_player_3_overall_rating,
    rpaa3.potential away_player_3_potential,
    rpaa3.preferred_foot away_player_3_preferred_foot,
    rpaa3.attacking_work_rate away_player_3_attacking_work_rate,
    rpaa3.defensive_work_rate away_player_3_defensive_work_rate,
    rpaa3.crossing away_player_3_crossing,
    rpaa3.finishing away_player_3_finishing,
    rpaa3.heading_accuracy away_player_3_heading_accuracy,
    rpaa3.short_passing away_player_3_short_passing,
    rpaa3.volleys away_player_3_volleys,
    rpaa3.dribbling away_player_3_dribbling,
    rpaa3.curve away_player_3_curve,
    rpaa3.free_kick_accuracy away_player_3_free_kick_accuracy,
    rpaa3.long_passing away_player_3_long_passing,
    rpaa3.ball_control away_player_3_ball_control,
    rpaa3.acceleration away_player_3_acceleration,
    rpaa3.sprint_speed away_player_3_sprint_speed,
    rpaa3.agility away_player_3_agility,
    rpaa3.reactions away_player_3_reactions,
    rpaa3.balance away_player_3_balance,
    rpaa3.shot_power away_player_3_shot_power,
    rpaa3.jumping away_player_3_jumping,
    rpaa3.stamina away_player_3_stamina,
    rpaa3.strength away_player_3_strength,
    rpaa3.long_shots away_player_3_long_shots,
    rpaa3.aggression away_player_3_aggression,
    rpaa3.interceptions away_player_3_interceptions,
    rpaa3.positioning away_player_3_positioning,
    rpaa3.vision away_player_3_vision,
    rpaa3.penalties away_player_3_penalties,
    rpaa3.marking away_player_3_marking,
    rpaa3.standing_tackle away_player_3_standing_tackle,
    rpaa3.sliding_tackle away_player_3_sliding_tackle,
    rpaa3.gk_diving away_player_3_gk_diving,
    rpaa3.gk_handling away_player_3_gk_handling,
    rpaa3.gk_kicking away_player_3_gk_kicking,
    rpaa3.gk_positioning away_player_3_gk_positioning,
    rpaa3.gk_reflexes away_player_3_gk_reflexes,
    
    rpaa4.player_name away_player_4_name,
    rpaa4.birthday away_player_4_birthday,
    rpaa4.height away_player_4_height,
    rpaa4.weight away_player_4_weight,
    rpaa4.overall_rating away_player_4_overall_rating,
    rpaa4.potential away_player_4_potential,
    rpaa4.preferred_foot away_player_4_preferred_foot,
    rpaa4.attacking_work_rate away_player_4_attacking_work_rate,
    rpaa4.defensive_work_rate away_player_4_defensive_work_rate,
    rpaa4.crossing away_player_4_crossing,
    rpaa4.finishing away_player_4_finishing,
    rpaa4.heading_accuracy away_player_4_heading_accuracy,
    rpaa4.short_passing away_player_4_short_passing,
    rpaa4.volleys away_player_4_volleys,
    rpaa4.dribbling away_player_4_dribbling,
    rpaa4.curve away_player_4_curve,
    rpaa4.free_kick_accuracy away_player_4_free_kick_accuracy,
    rpaa4.long_passing away_player_4_long_passing,
    rpaa4.ball_control away_player_4_ball_control,
    rpaa4.acceleration away_player_4_acceleration,
    rpaa4.sprint_speed away_player_4_sprint_speed,
    rpaa4.agility away_player_4_agility,
    rpaa4.reactions away_player_4_reactions,
    rpaa4.balance away_player_4_balance,
    rpaa4.shot_power away_player_4_shot_power,
    rpaa4.jumping away_player_4_jumping,
    rpaa4.stamina away_player_4_stamina,
    rpaa4.strength away_player_4_strength,
    rpaa4.long_shots away_player_4_long_shots,
    rpaa4.aggression away_player_4_aggression,
    rpaa4.interceptions away_player_4_interceptions,
    rpaa4.positioning away_player_4_positioning,
    rpaa4.vision away_player_4_vision,
    rpaa4.penalties away_player_4_penalties,
    rpaa4.marking away_player_4_marking,
    rpaa4.standing_tackle away_player_4_standing_tackle,
    rpaa4.sliding_tackle away_player_4_sliding_tackle,
    rpaa4.gk_diving away_player_4_gk_diving,
    rpaa4.gk_handling away_player_4_gk_handling,
    rpaa4.gk_kicking away_player_4_gk_kicking,
    rpaa4.gk_positioning away_player_4_gk_positioning,
    rpaa4.gk_reflexes away_player_4_gk_reflexes,
    
    rpaa5.player_name away_player_5_name,
    rpaa5.birthday away_player_5_birthday,
    rpaa5.height away_player_5_height,
    rpaa5.weight away_player_5_weight,
    rpaa5.overall_rating away_player_5_overall_rating,
    rpaa5.potential away_player_5_potential,
    rpaa5.preferred_foot away_player_5_preferred_foot,
    rpaa5.attacking_work_rate away_player_5_attacking_work_rate,
    rpaa5.defensive_work_rate away_player_5_defensive_work_rate,
    rpaa5.crossing away_player_5_crossing,
    rpaa5.finishing away_player_5_finishing,
    rpaa5.heading_accuracy away_player_5_heading_accuracy,
    rpaa5.short_passing away_player_5_short_passing,
    rpaa5.volleys away_player_5_volleys,
    rpaa5.dribbling away_player_5_dribbling,
    rpaa5.curve away_player_5_curve,
    rpaa5.free_kick_accuracy away_player_5_free_kick_accuracy,
    rpaa5.long_passing away_player_5_long_passing,
    rpaa5.ball_control away_player_5_ball_control,
    rpaa5.acceleration away_player_5_acceleration,
    rpaa5.sprint_speed away_player_5_sprint_speed,
    rpaa5.agility away_player_5_agility,
    rpaa5.reactions away_player_5_reactions,
    rpaa5.balance away_player_5_balance,
    rpaa5.shot_power away_player_5_shot_power,
    rpaa5.jumping away_player_5_jumping,
    rpaa5.stamina away_player_5_stamina,
    rpaa5.strength away_player_5_strength,
    rpaa5.long_shots away_player_5_long_shots,
    rpaa5.aggression away_player_5_aggression,
    rpaa5.interceptions away_player_5_interceptions,
    rpaa5.positioning away_player_5_positioning,
    rpaa5.vision away_player_5_vision,
    rpaa5.penalties away_player_5_penalties,
    rpaa5.marking away_player_5_marking,
    rpaa5.standing_tackle away_player_5_standing_tackle,
    rpaa5.sliding_tackle away_player_5_sliding_tackle,
    rpaa5.gk_diving away_player_5_gk_diving,
    rpaa5.gk_handling away_player_5_gk_handling,
    rpaa5.gk_kicking away_player_5_gk_kicking,
    rpaa5.gk_positioning away_player_5_gk_positioning,
    rpaa5.gk_reflexes away_player_5_gk_reflexes,
    
    rpaa6.player_name away_player_6_name,
    rpaa6.birthday away_player_6_birthday,
    rpaa6.height away_player_6_height,
    rpaa6.weight away_player_6_weight,
    rpaa6.overall_rating away_player_6_overall_rating,
    rpaa6.potential away_player_6_potential,
    rpaa6.preferred_foot away_player_6_preferred_foot,
    rpaa6.attacking_work_rate away_player_6_attacking_work_rate,
    rpaa6.defensive_work_rate away_player_6_defensive_work_rate,
    rpaa6.crossing away_player_6_crossing,
    rpaa6.finishing away_player_6_finishing,
    rpaa6.heading_accuracy away_player_6_heading_accuracy,
    rpaa6.short_passing away_player_6_short_passing,
    rpaa6.volleys away_player_6_volleys,
    rpaa6.dribbling away_player_6_dribbling,
    rpaa6.curve away_player_6_curve,
    rpaa6.free_kick_accuracy away_player_6_free_kick_accuracy,
    rpaa6.long_passing away_player_6_long_passing,
    rpaa6.ball_control away_player_6_ball_control,
    rpaa6.acceleration away_player_6_acceleration,
    rpaa6.sprint_speed away_player_6_sprint_speed,
    rpaa6.agility away_player_6_agility,
    rpaa6.reactions away_player_6_reactions,
    rpaa6.balance away_player_6_balance,
    rpaa6.shot_power away_player_6_shot_power,
    rpaa6.jumping away_player_6_jumping,
    rpaa6.stamina away_player_6_stamina,
    rpaa6.strength away_player_6_strength,
    rpaa6.long_shots away_player_6_long_shots,
    rpaa6.aggression away_player_6_aggression,
    rpaa6.interceptions away_player_6_interceptions,
    rpaa6.positioning away_player_6_positioning,
    rpaa6.vision away_player_6_vision,
    rpaa6.penalties away_player_6_penalties,
    rpaa6.marking away_player_6_marking,
    rpaa6.standing_tackle away_player_6_standing_tackle,
    rpaa6.sliding_tackle away_player_6_sliding_tackle,
    rpaa6.gk_diving away_player_6_gk_diving,
    rpaa6.gk_handling away_player_6_gk_handling,
    rpaa6.gk_kicking away_player_6_gk_kicking,
    rpaa6.gk_positioning away_player_6_gk_positioning,
    rpaa6.gk_reflexes away_player_6_gk_reflexes,
    
    rpaa7.player_name away_player_7_name,
    rpaa7.birthday away_player_7_birthday,
    rpaa7.height away_player_7_height,
    rpaa7.weight away_player_7_weight,
    rpaa7.overall_rating away_player_7_overall_rating,
    rpaa7.potential away_player_7_potential,
    rpaa7.preferred_foot away_player_7_preferred_foot,
    rpaa7.attacking_work_rate away_player_7_attacking_work_rate,
    rpaa7.defensive_work_rate away_player_7_defensive_work_rate,
    rpaa7.crossing away_player_7_crossing,
    rpaa7.finishing away_player_7_finishing,
    rpaa7.heading_accuracy away_player_7_heading_accuracy,
    rpaa7.short_passing away_player_7_short_passing,
    rpaa7.volleys away_player_7_volleys,
    rpaa7.dribbling away_player_7_dribbling,
    rpaa7.curve away_player_7_curve,
    rpaa7.free_kick_accuracy away_player_7_free_kick_accuracy,
    rpaa7.long_passing away_player_7_long_passing,
    rpaa7.ball_control away_player_7_ball_control,
    rpaa7.acceleration away_player_7_acceleration,
    rpaa7.sprint_speed away_player_7_sprint_speed,
    rpaa7.agility away_player_7_agility,
    rpaa7.reactions away_player_7_reactions,
    rpaa7.balance away_player_7_balance,
    rpaa7.shot_power away_player_7_shot_power,
    rpaa7.jumping away_player_7_jumping,
    rpaa7.stamina away_player_7_stamina,
    rpaa7.strength away_player_7_strength,
    rpaa7.long_shots away_player_7_long_shots,
    rpaa7.aggression away_player_7_aggression,
    rpaa7.interceptions away_player_7_interceptions,
    rpaa7.positioning away_player_7_positioning,
    rpaa7.vision away_player_7_vision,
    rpaa7.penalties away_player_7_penalties,
    rpaa7.marking away_player_7_marking,
    rpaa7.standing_tackle away_player_7_standing_tackle,
    rpaa7.sliding_tackle away_player_7_sliding_tackle,
    rpaa7.gk_diving away_player_7_gk_diving,
    rpaa7.gk_handling away_player_7_gk_handling,
    rpaa7.gk_kicking away_player_7_gk_kicking,
    rpaa7.gk_positioning away_player_7_gk_positioning,
    rpaa7.gk_reflexes away_player_7_gk_reflexes,
    
    rpaa8.player_name away_player_8_name,
    rpaa8.birthday away_player_8_birthday,
    rpaa8.height away_player_8_height,
    rpaa8.weight away_player_8_weight,
    rpaa8.overall_rating away_player_8_overall_rating,
    rpaa8.potential away_player_8_potential,
    rpaa8.preferred_foot away_player_8_preferred_foot,
    rpaa8.attacking_work_rate away_player_8_attacking_work_rate,
    rpaa8.defensive_work_rate away_player_8_defensive_work_rate,
    rpaa8.crossing away_player_8_crossing,
    rpaa8.finishing away_player_8_finishing,
    rpaa8.heading_accuracy away_player_8_heading_accuracy,
    rpaa8.short_passing away_player_8_short_passing,
    rpaa8.volleys away_player_8_volleys,
    rpaa8.dribbling away_player_8_dribbling,
    rpaa8.curve away_player_8_curve,
    rpaa8.free_kick_accuracy away_player_8_free_kick_accuracy,
    rpaa8.long_passing away_player_8_long_passing,
    rpaa8.ball_control away_player_8_ball_control,
    rpaa8.acceleration away_player_8_acceleration,
    rpaa8.sprint_speed away_player_8_sprint_speed,
    rpaa8.agility away_player_8_agility,
    rpaa8.reactions away_player_8_reactions,
    rpaa8.balance away_player_8_balance,
    rpaa8.shot_power away_player_8_shot_power,
    rpaa8.jumping away_player_8_jumping,
    rpaa8.stamina away_player_8_stamina,
    rpaa8.strength away_player_8_strength,
    rpaa8.long_shots away_player_8_long_shots,
    rpaa8.aggression away_player_8_aggression,
    rpaa8.interceptions away_player_8_interceptions,
    rpaa8.positioning away_player_8_positioning,
    rpaa8.vision away_player_8_vision,
    rpaa8.penalties away_player_8_penalties,
    rpaa8.marking away_player_8_marking,
    rpaa8.standing_tackle away_player_8_standing_tackle,
    rpaa8.sliding_tackle away_player_8_sliding_tackle,
    rpaa8.gk_diving away_player_8_gk_diving,
    rpaa8.gk_handling away_player_8_gk_handling,
    rpaa8.gk_kicking away_player_8_gk_kicking,
    rpaa8.gk_positioning away_player_8_gk_positioning,
    rpaa8.gk_reflexes away_player_8_gk_reflexes,
    
    rpaa9.player_name away_player_9_name,
    rpaa9.birthday away_player_9_birthday,
    rpaa9.height away_player_9_height,
    rpaa9.weight away_player_9_weight,
    rpaa9.overall_rating away_player_9_overall_rating,
    rpaa9.potential away_player_9_potential,
    rpaa9.preferred_foot away_player_9_preferred_foot,
    rpaa9.attacking_work_rate away_player_9_attacking_work_rate,
    rpaa9.defensive_work_rate away_player_9_defensive_work_rate,
    rpaa9.crossing away_player_9_crossing,
    rpaa9.finishing away_player_9_finishing,
    rpaa9.heading_accuracy away_player_9_heading_accuracy,
    rpaa9.short_passing away_player_9_short_passing,
    rpaa9.volleys away_player_9_volleys,
    rpaa9.dribbling away_player_9_dribbling,
    rpaa9.curve away_player_9_curve,
    rpaa9.free_kick_accuracy away_player_9_free_kick_accuracy,
    rpaa9.long_passing away_player_9_long_passing,
    rpaa9.ball_control away_player_9_ball_control,
    rpaa9.acceleration away_player_9_acceleration,
    rpaa9.sprint_speed away_player_9_sprint_speed,
    rpaa9.agility away_player_9_agility,
    rpaa9.reactions away_player_9_reactions,
    rpaa9.balance away_player_9_balance,
    rpaa9.shot_power away_player_9_shot_power,
    rpaa9.jumping away_player_9_jumping,
    rpaa9.stamina away_player_9_stamina,
    rpaa9.strength away_player_9_strength,
    rpaa9.long_shots away_player_9_long_shots,
    rpaa9.aggression away_player_9_aggression,
    rpaa9.interceptions away_player_9_interceptions,
    rpaa9.positioning away_player_9_positioning,
    rpaa9.vision away_player_9_vision,
    rpaa9.penalties away_player_9_penalties,
    rpaa9.marking away_player_9_marking,
    rpaa9.standing_tackle away_player_9_standing_tackle,
    rpaa9.sliding_tackle away_player_9_sliding_tackle,
    rpaa9.gk_diving away_player_9_gk_diving,
    rpaa9.gk_handling away_player_9_gk_handling,
    rpaa9.gk_kicking away_player_9_gk_kicking,
    rpaa9.gk_positioning away_player_9_gk_positioning,
    rpaa9.gk_reflexes away_player_9_gk_reflexes,
    
    rpaa10.player_name away_player_10_name,
    rpaa10.birthday away_player_10_birthday,
    rpaa10.height away_player_10_height,
    rpaa10.weight away_player_10_weight,
    rpaa10.overall_rating away_player_10_overall_rating,
    rpaa10.potential away_player_10_potential,
    rpaa10.preferred_foot away_player_10_preferred_foot,
    rpaa10.attacking_work_rate away_player_10_attacking_work_rate,
    rpaa10.defensive_work_rate away_player_10_defensive_work_rate,
    rpaa10.crossing away_player_10_crossing,
    rpaa10.finishing away_player_10_finishing,
    rpaa10.heading_accuracy away_player_10_heading_accuracy,
    rpaa10.short_passing away_player_10_short_passing,
    rpaa10.volleys away_player_10_volleys,
    rpaa10.dribbling away_player_10_dribbling,
    rpaa10.curve away_player_10_curve,
    rpaa10.free_kick_accuracy away_player_10_free_kick_accuracy,
    rpaa10.long_passing away_player_10_long_passing,
    rpaa10.ball_control away_player_10_ball_control,
    rpaa10.acceleration away_player_10_acceleration,
    rpaa10.sprint_speed away_player_10_sprint_speed,
    rpaa10.agility away_player_10_agility,
    rpaa10.reactions away_player_10_reactions,
    rpaa10.balance away_player_10_balance,
    rpaa10.shot_power away_player_10_shot_power,
    rpaa10.jumping away_player_10_jumping,
    rpaa10.stamina away_player_10_stamina,
    rpaa10.strength away_player_10_strength,
    rpaa10.long_shots away_player_10_long_shots,
    rpaa10.aggression away_player_10_aggression,
    rpaa10.interceptions away_player_10_interceptions,
    rpaa10.positioning away_player_10_positioning,
    rpaa10.vision away_player_10_vision,
    rpaa10.penalties away_player_10_penalties,
    rpaa10.marking away_player_10_marking,
    rpaa10.standing_tackle away_player_10_standing_tackle,
    rpaa10.sliding_tackle away_player_10_sliding_tackle,
    rpaa10.gk_diving away_player_10_gk_diving,
    rpaa10.gk_handling away_player_10_gk_handling,
    rpaa10.gk_kicking away_player_10_gk_kicking,
    rpaa10.gk_positioning away_player_10_gk_positioning,
    rpaa10.gk_reflexes away_player_10_gk_reflexes,
    
    rpaa11.player_name away_player_11_name,
    rpaa11.birthday away_player_11_birthday,
    rpaa11.height away_player_11_height,
    rpaa11.weight away_player_11_weight,
    rpaa11.overall_rating away_player_11_overall_rating,
    rpaa11.potential away_player_11_potential,
    rpaa11.preferred_foot away_player_11_preferred_foot,
    rpaa11.attacking_work_rate away_player_11_attacking_work_rate,
    rpaa11.defensive_work_rate away_player_11_defensive_work_rate,
    rpaa11.crossing away_player_11_crossing,
    rpaa11.finishing away_player_11_finishing,
    rpaa11.heading_accuracy away_player_11_heading_accuracy,
    rpaa11.short_passing away_player_11_short_passing,
    rpaa11.volleys away_player_11_volleys,
    rpaa11.dribbling away_player_11_dribbling,
    rpaa11.curve away_player_11_curve,
    rpaa11.free_kick_accuracy away_player_11_free_kick_accuracy,
    rpaa11.long_passing away_player_11_long_passing,
    rpaa11.ball_control away_player_11_ball_control,
    rpaa11.acceleration away_player_11_acceleration,
    rpaa11.sprint_speed away_player_11_sprint_speed,
    rpaa11.agility away_player_11_agility,
    rpaa11.reactions away_player_11_reactions,
    rpaa11.balance away_player_11_balance,
    rpaa11.shot_power away_player_11_shot_power,
    rpaa11.jumping away_player_11_jumping,
    rpaa11.stamina away_player_11_stamina,
    rpaa11.strength away_player_11_strength,
    rpaa11.long_shots away_player_11_long_shots,
    rpaa11.aggression away_player_11_aggression,
    rpaa11.interceptions away_player_11_interceptions,
    rpaa11.positioning away_player_11_positioning,
    rpaa11.vision away_player_11_vision,
    rpaa11.penalties away_player_11_penalties,
    rpaa11.marking away_player_11_marking,
    rpaa11.standing_tackle away_player_11_standing_tackle,
    rpaa11.sliding_tackle away_player_11_sliding_tackle,
    rpaa11.gk_diving away_player_11_gk_diving,
    rpaa11.gk_handling away_player_11_gk_handling,
    rpaa11.gk_kicking away_player_11_gk_kicking,
    rpaa11.gk_positioning away_player_11_gk_positioning,
    rpaa11.gk_reflexes away_player_11_gk_reflexes,

    
    l.name league,
    c.name country
    
from 

    match m
    
    left join ranked_attributes_home rta_home 
    on m.home_team_api_id = rta_home.team_api_id 
    and rta_home.date_rank = 1
    
    left join ranked_attributes_away rta_away 
    on m.away_team_api_id = rta_away.team_api_id 
    and rta_away.date_rank = 1
    

    left join ranked_player_1_attributes_home rpah1
    on m.home_player_1 = rpah1.player_api_id
    and rpah1.date_rank = 1
    
    left join ranked_player_2_attributes_home rpah2
    on m.home_player_2 = rpah2.player_api_id
    and rpah2.date_rank = 1
    
    left join ranked_player_3_attributes_home rpah3
    on m.home_player_3 = rpah3.player_api_id
    and rpah3.date_rank = 1
    
    left join ranked_player_4_attributes_home rpah4
    on m.home_player_4 = rpah4.player_api_id
    and rpah4.date_rank = 1 
    
    left join ranked_player_5_attributes_home rpah5
    on m.home_player_5 = rpah5.player_api_id
    and rpah5.date_rank = 1
    
    left join ranked_player_6_attributes_home rpah6
    on m.home_player_6 = rpah6.player_api_id
    and rpah6.date_rank = 1
    
    left join ranked_player_7_attributes_home rpah7
    on m.home_player_7 = rpah7.player_api_id
    and rpah7.date_rank = 1
    
    left join ranked_player_8_attributes_home rpah8
    on m.home_player_8 = rpah8.player_api_id
    and rpah8.date_rank = 1 
    
    left join ranked_player_9_attributes_home rpah9
    on m.home_player_9 = rpah9.player_api_id
    and rpah9.date_rank = 1
    
    left join ranked_player_10_attributes_home rpah10
    on m.home_player_10 = rpah10.player_api_id
    and rpah10.date_rank = 1 
    
    left join ranked_player_11_attributes_home rpah11
    on m.home_player_11 = rpah11.player_api_id
    and rpah11.date_rank = 1


    left join ranked_player_1_attributes_away rpaa1
    on m.away_player_1 = rpaa1.player_api_id
    and rpaa1.date_rank = 1
    
    left join ranked_player_2_attributes_away rpaa2
    on m.away_player_2 = rpaa2.player_api_id
    and rpaa2.date_rank = 1
    
    left join ranked_player_3_attributes_away rpaa3
    on m.away_player_3 = rpaa3.player_api_id
    and rpaa3.date_rank = 1
    
    left join ranked_player_4_attributes_away rpaa4
    on m.away_player_4 = rpaa4.player_api_id
    and rpaa4.date_rank = 1 
    
    left join ranked_player_5_attributes_away rpaa5
    on m.away_player_5 = rpaa5.player_api_id
    and rpaa5.date_rank = 1
    
    left join ranked_player_6_attributes_away rpaa6
    on m.away_player_6 = rpaa6.player_api_id
    and rpaa6.date_rank = 1
    
    left join ranked_player_7_attributes_away rpaa7
    on m.away_player_7 = rpaa7.player_api_id
    and rpaa7.date_rank = 1
    
    left join ranked_player_8_attributes_away rpaa8
    on m.away_player_8 = rpaa8.player_api_id
    and rpaa8.date_rank = 1 
    
    left join ranked_player_9_attributes_away rpaa9
    on m.away_player_9 = rpaa9.player_api_id
    and rpaa9.date_rank = 1
    
    left join ranked_player_10_attributes_away rpaa10
    on m.away_player_10 = rpaa10.player_api_id
    and rpaa10.date_rank = 1 
    
    left join ranked_player_11_attributes_away rpaa11
    on m.away_player_11 = rpaa11.player_api_id
    and rpaa11.date_rank = 1

    
    left join league l 
    on m.league_id = l.id
    
    left join country c
    on l.country_id = c.id