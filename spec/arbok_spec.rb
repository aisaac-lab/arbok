# frozen_string_literal: true

RSpec.describe Arbok do
  let(:proxy_url) { ENV.fetch('URL') { '' } }
  let(:proxy_user) { ENV.fetch('USER') { '' } }
  let(:proxy_pass) { ENV.fetch('PASS') { '' } }


  subject {
    Arbok.new(proxy: {
      url:  proxy_url,
      user: proxy_user,
      pass: proxy_pass,
    })
  }

  it "has a version number" do
    expect(Arbok::VERSION).not_to be nil
  end

  example do
    res = subject.get('https://gogotanaka.me/')
    expect(res.body.empty?).to eq(false)
  end

  example do
    ips = 10.times.map {
      res = Arbok.new(proxy: {
        url:  proxy_url,
        user: proxy_user,
        pass: proxy_pass,
      }).get('https://api.ipify.org?format=json')
      JSON.parse(res.body)['ip'].tap { |ip| puts ip }
    }

    expect(5 < ips.uniq.count).to eq(true)
  end

  example do
    res = subject.get('http://google.com/')
    expect(res).to eq(nil)

    res = subject.get('http://google.com/', need_redirect: true)
    expect(res.body.empty?).to eq(false)
  end
end
