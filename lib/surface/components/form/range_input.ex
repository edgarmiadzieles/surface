defmodule Surface.Components.Form.RangeInput do
  @moduledoc """
  An input field that let the user specify a numeric value in a given **range**,
  usually using a slider.

  Provides a wrapper for Phoenix.HTML.Form's `range_input/3` function.

  All options passed via `opts` will be sent to `range_input/3`, `value`, `min`, `max`
  and `class` can be set directly and will override anything in `opts`.


  ## Examples

  ```
  <RangeInput form="volume" field="percent" min="0" max="100" step="5" value="40" opts={{ autofocus: "autofocus" }} />
  ```
  """

  use Surface.Components.Form.Input

  import Phoenix.HTML.Form, only: [range_input: 3]
  import Surface.Components.Form.Utils

  @doc "Minimum value for the input"
  property min, :string

  @doc "Maximum value for the input"
  property max, :string

  @doc "Sets or returns the value of the step attribute of the slider control"
  property step, :string

  context get form, from: Form, as: :form_context
  context get field, from: Field, as: :field_context

  def render(assigns) do
    form = get_form(assigns)
    field = get_field(assigns)

    props =
      get_non_nil_props(assigns, [:value, :min, :max, :step, class: get_config(:default_class)])

    event_opts = get_events_to_opts(assigns)

    ~H"""
    {{ range_input(form, field, props ++ @opts ++ event_opts) }}
    """
  end
end
