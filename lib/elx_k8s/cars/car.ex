defmodule ElxK8s.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :brand, :string
    field :description, :string
    field :category, :id

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:brand, :description])
    |> validate_required([:brand, :description])
  end
end
