function startill(cmd)

if nargin == 0
  cmd = 'listdlg';
end

cmds = {'help', 'mfit','mview','rescal'};
tips = {'Help', 'Data Fitting (mfit+mview+rescal)','Data browsing (mview+mfit+rescal)','TAS resolution function (ONLY rescal)'};


if strcmp(cmd, 'listdlg')

  sel = listdlg('ListString', tips, ...
    'Name','Some ILL Applications', ...
    'PromptString','Select application to start', ...
    'CancelString','Cancel/Exit','ListSize',[ 250 100 ]);

  if sel == 0, exit; end

  for index = 1:length(sel)
    startill(cmds{sel(index)});
  end

end

if strcmp(cmd, 'mfit')
  disp('Starting MFit');
  mfit;
end

if strcmp(cmd, 'mview')
  disp('Starting MView');
  mview;
end

if strcmp(cmd, 'rescal')
  disp('Starting Rescal/Matlab (only)');
  rescal;
end

if strcmp(cmd, 'help')
  disp('Display Help');
  this_help = { ...
  'Please choose one or more applications', ...
  'to start from the list or press Cancel to Exit', ...
  '', ...
  'MFit: load a single data file, fit it with any 1D function, and save results', ...
  '',...
  'MView: Load many data files in order to compare, combine and perform operations', ...
  '', ...
  'Rescal: Compute 4D TAS-resolution ellipsoid', ...
  '', ...
  '(c) ILL/DS/CS. E. Farhi, A. Lagrange', ...
  'URL: http://www.ill.fr/tas/matlab/doc'};
  msgbox(this_help, 'Start ILL applications: Help','help');

  startill;
end