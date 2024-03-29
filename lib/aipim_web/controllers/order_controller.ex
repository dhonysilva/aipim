defmodule AipimWeb.OrderController do
  use AipimWeb, :controller

  alias Aipim.Orders

  def create(conn, _) do
    case Orders.complete_order(conn.assigns.cart) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: ~p"/orders/#{order}")

      {:error, _reason} ->
        conn
        |> put_flash(:info, "There was an error processing your order")
        |> redirect(to: ~p"/cart")
    end
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns[:current_user]

    order = Orders.get_order!(user, id)
    render(conn, :show, order: order)
  end
end
