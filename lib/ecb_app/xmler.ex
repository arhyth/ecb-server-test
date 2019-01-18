defmodule Xmler do
  @moduledoc """
  XML parser
  """
  import Record

  defrecord(:xmlElement, extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl"))
  defrecord(:xmlAttribute, extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl"))

  def path_string(doc, xpath) do
    :xmerl_xpath.string(xpath, doc)
  end
end