module LogicHelper

  def implement_logic_features(feats)
    logicHash = {}
    #is_dancing
    if feats['danceability']['median'] >= 0.7 and feats['energy']['median'] >= 0.65 and feats['tempo']['median'] >= 115
      logicHash['is_dancing'] = 2
    elsif feats['danceability']['median'] < 0.5 and feats['energy']['median'] < 0.5 and feats['tempo']['median'] < 115
      logicHash['is_dancing'] = 0
    else logicHash['is_dancing'] = 1
    end

    #is_vocal
    if feats['instrumentalness']['median'] < 0.15
      logicHash['is_vocal'] = 2
    elsif feats['instrumentalness']['median'] >= 0.8
      logicHash['is_vocal'] = 0
    else logicHash['is_vocal'] = 1
    end

    #is_summer
    if feats['valence']['median'] >= 0.7
      logicHash['is_summer'] = 2
    elsif feats['valence']['median'] < 0.3
      logicHash['is_summer'] = 0
    else logicHash['is_summer'] = 1
    end

    #is_robot
    if feats['acousticness']['median'] < 0.15 and feats['instrumentalness']['median'] > 0.70
      logicHash['is_robot'] = 2
    elsif feats['acousticness']['median'] > 0.7
      logicHash['is_robot'] = 0
    else logicHash['is_robot'] = 1
    end

    return logicHash
  end



end
