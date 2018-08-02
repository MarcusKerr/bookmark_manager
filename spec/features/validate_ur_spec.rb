feature 'validate url' do
  scenario 'error meassaage if url is invalid' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'htp://22.c'
    click_button 'Submit'
    expect(page).to have_content('Invalid URL')
  end
end
