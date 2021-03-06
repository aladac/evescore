# frozen_string_literal: true

module LinkHelper
  def breadcrumbs(*crumbs)
    render partial: 'shared/breadcrumbs', locals: { crumbs: crumbs }
  end
  
  def group_link(group)
    if group.faction
      link_to group.name, group_path(group.faction, group)
    else
      link_to group.name, generic_group_path(group)
    end
  end

  def character_link(character, options = {})
    character = Character.find(character) unless character.is_a?(Character)
    link_to character.name, character_profile_path(character), options
  end

  def character_ticks_link(character)
    link_to 'Ticks', character_journal_path(character)
  end

  def character_image_link(character_id, size = 64, options = {})
    link_to character_image(character_id, size, options), character_profile_path(character_id)
  end

  def corporations_link(options = {})
    link_to 'Corporations', corporations_path, options
  end

  def corporation_link(corporation, options = {})
    corporation = Corporation.find(corporation) unless corporation.is_a?(Corporation)
    link_to corporation.name, corporation_path(corporation), options
  end

  def corporation_image_link(corporation, size = 32, options = {})
    corporation = Corporation.find(corporation) unless corporation.is_a?(Corporation)
    link_to corporation_image(corporation.id, size, options), corporation_path(corporation)
  end

  def welcome_page_link(options = {})
    link_to 'Welcome Page', root_path, options
  end

  def rat_link(rat)
    link_to rat.name, rats_path(rat)
  end

  def rat_image_link(rat_id, size = 32, options = {})
    link_to type_image(rat_id, size, options), rats_path(rat_id)
  end
end
