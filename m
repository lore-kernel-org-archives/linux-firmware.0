Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7DC3600C
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 12:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 054E6C4CEEB; Tue,  8 Apr 2025 12:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30D1C4AF09
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 12:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116596;
	bh=m5eEm70fLPDaGbET9rfmQAXkyJNazFnvwjhuG+SIMq0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oZM9+2IIHxffd1KJ8ewlet9+dtH7FeM9lxetdQt1pzpSBwmO5w5lFNOtpG53RxZn1
	 st91cMMdbP0+ONPHNhN9HavWQnAEUqVbpnoRzeqEk9GG0RUMJv37OhW8fNwNOXtlt/
	 wvI0YEL+tVKRWWyWkQBTnPFZ+eaMW3B4N+1NqUfj/Z7pr0U+8OTzS925KsOUR62/KR
	 eWr2O5RGN+FXZm61FPRVkqW+VOgsJc8wmOqLY+HpSussJ7uFYceIQEpcucBTIY/Y5i
	 mOG2V5bT61ecH2HNRE0lzw3LO+gH0sjrgCZ0KJSioqxaPM3lUIR1hO7ns7RarMXVHI
	 N4RmKwXFdYsww==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e643f235a34so4075206276.1
        for <linux-firmware@kernel.org>; Tue, 08 Apr 2025 05:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUIEgMq8XnnWntgdwTYhZjrrHnI5422Tyg6ewK7OfQvDIJYRTvmK0pCXMxhXH1jt6mmKWm3felh2vEUS9oqw==@kernel.org
X-Gm-Message-State: AOJu0YxZtV2KhiIwfVMew6FcaMfRZQYb5qalMCgKAtnS3iMG6V+1D3l7
	0WSo7QGUHdSxqwDZEctEnZAfMoWQAIUM2LgKpEyFXd/a0wzf6aNT4dkVIQ2rOkYwEvL4l+NijBL
	2W+l/E0i1l0MSsbn4fS3vw2HIJok=
X-Google-Smtp-Source: AGHT+IGj7PZKZL0vVvZW8fmyKkE204+bmkBh+Erd+FaBfDlEcTom6+ZGbuUnA2W+Z+dsqWS1z3peO8QsrbbS3n5oGHo=
X-Received: by 2002:a05:6902:a85:b0:e6d:f47a:f873 with SMTP id
 3f1490d57ef6-e6e1c1a745cmr27674442276.9.1744116596181; Tue, 08 Apr 2025
 05:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
 <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
 <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com> <lmntn442hpprtvhxifxqdycpcqhjcl2oz4fp2egozv5vb7c75v@nm7nojxkmtkh>
In-Reply-To: <lmntn442hpprtvhxifxqdycpcqhjcl2oz4fp2egozv5vb7c75v@nm7nojxkmtkh>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Apr 2025 08:49:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA43pmNLaZz2rWkWRvyYJmjVqzbjaDVSLrvcvkY0NwwTow@mail.gmail.com>
X-Gm-Features: ATxdqUFgIj6YIjdumEvEQkHwnNXAp0lrnI3-BtaKHbwI3v1kmz_CxMJKkEAdvSE
Message-ID: <CA+5PVA43pmNLaZz2rWkWRvyYJmjVqzbjaDVSLrvcvkY0NwwTow@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org, 
	agurenko@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:46=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Apr 08, 2025 at 07:59:40AM -0400, Josh Boyer wrote:
> > On Tue, Apr 8, 2025 at 7:43=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> > > > Hi linux-firmware maintainers
> > > >
> > > > Here's a pull request for btqca bluetooth driver. Please let me kno=
w if
> > > > you have any problems.
> > > >
> > > > The following changes since commit 41a528251649772edbcb705a40e617fd=
14858e53:
> > > >
> > > >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +=
0000)
> > > >
> > > > are available in the git repository at:
> > > >
> > > >   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> > > >
> > > > for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8=
ce76:
> > > >
> > > >   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:1=
8:24
> > > > +0800)
> > >
> > >
> > > Josh, it seems this pull request got ingored / skipped by the robot.
> > > Could you please take a look?
> >
> > Thank you for the heads up.  There was a merge conflict in WHENCE that
> > I manually fixed up.  New MR here:
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510
>
> Thanks! It seems check-commits errors out on merge commits.

Yeah, which is weird.  I haven't run into that before.  I'll poke at it.

josh
