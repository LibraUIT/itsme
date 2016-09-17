class IdolInfoDecorator < Draper::Decorator

  delegate_all

  def dob
    helpers.content_tag :span, class: 'dob' do
      object.dob.strftime('%d/%m/%Y')
    end
  end

  def getting_start
    helpers.content_tag :span, class: 'getting-start' do
      object.getting_start.strftime('%d/%m/%Y')
    end
  end

  def update_avatar
    helpers.content_tag :span, class: 'change-avatar' do
      object.update_avatar ? 'Yes' : 'No'
    end
  end

  def good_lightening
    helpers.content_tag :span, class: 'good-lightening' do
      object.good_lightening ? 'Yes' : 'No'
    end
  end

end
