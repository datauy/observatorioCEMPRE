module BuyersHelper
  def semaphore(color)
    "<div class='semaphore'>
      <span class='circle big red #{color != 'Rojo' ? 'fade' : ''}'></span>
      <span class='circle big yellow #{color != 'Amarillo' ? 'fade' : ''}'></span>
      <span class='circle big green #{color != 'Verde' ? 'fade' : ''}'></span>
    </div>".html_safe
  end
end
