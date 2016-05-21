defmodule Reel.Schema do
  use Absinthe.Schema

  import_types Reel.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &Reel.PostResolver.all/2
    end
  end

end
