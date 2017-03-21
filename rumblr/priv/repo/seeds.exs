alias Rumblr.Repo
alias Rumblr.Category

for category <- ~w( Action Drama Romance Comedy Sci-Fi ) do
  Repo.insert!(%Category{name: category})
end