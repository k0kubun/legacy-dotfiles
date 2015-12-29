module StackProfRunner
  def run(*)
    super
    StackProf.stop

    report = StackProf::Report.new(StackProf.results)
    report.print_text(false)
  end
end
Itamae::Runner.prepend(StackProfRunner)

require 'stackprof'
StackProf.start(mode: :wall, interval: 4, raw: false)
