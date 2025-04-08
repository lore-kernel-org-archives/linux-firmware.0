Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9401C369A2
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 13:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D406C4CEEC; Tue,  8 Apr 2025 13:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663A3C4CEEB;
	Tue,  8 Apr 2025 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744119973;
	bh=znCtTydwodAFH0/zvMPmZVW40c3cB+GZ9k1zyONtnWc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BpBVScolAwIPauFth3+/8cLyTX7af06M7lCvLZUBdpwcawNJq0LHabqyK6CtOT52c
	 cdcDtuvDkfCxQo2YW1slhMRreV8B/kXbQ1UiQ4ibQE29Vwk1/aaWpYIXw26oUq6ttz
	 3RhvspIJ55WaGObsEYtWOUiPaRoK6pCQR4oshUZfrFdRC/a7DRdcHM8+a4mDu/b8Il
	 TgzaJ44l748zBjBp0JI7h6cSDmVB+ulh1aCAruos7sK29Loc6jZBzgb9hcXYkatuXs
	 alh4qdAgL7MwDKppGhZq8ABdolZq/Go4SHeoCcLoATZJV+xHS/ZLNzzhQNq8/VFmo7
	 foubuoIEsKj1A==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e69483d136eso4038235276.3;
        Tue, 08 Apr 2025 06:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3o3y0S3vdbLipdldNKWfv0/mvnfLlGgct03ZFRQYYSTt52xr0L9KT/D7Op9QqFE76HjQz1i5ag0JRuTpESg==@kernel.org
X-Gm-Message-State: AOJu0YybXlSPySgKQ6Y83zuepdTBOwPkIUZLG0+AsMkzmmf8R1RGzKZU
	x+fDh7jTBY1t2Z/t2oup5RXOeXHI5jot7/xBx4pYnUEQDm9bAHcZiQs4ErKRHbKCect8BR1Jysd
	RBhz0bwq8bUrtP0BnIpzWiy2/c6I=
X-Google-Smtp-Source: AGHT+IFYJYfqrHocWvrCWIttXXGhdytWt/xf7ZWJwDl8xwYiM4A733PW58g/g14VzLq3sbYlm5u3xNqV9JACYXP+XP8=
X-Received: by 2002:a05:6902:2410:b0:e64:54c:2262 with SMTP id
 3f1490d57ef6-e6e1fa84325mr24772685276.30.1744119972625; Tue, 08 Apr 2025
 06:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
 <r5wix6wmi5mw43cyzwb3j36az66nih2bwurkikgwgw33kltg3p@b7hyrp3kqyg4>
 <CA+5PVA7=qvpoY1VsxbReiLjKYhFd3xysmC51VvVujWQ2MkZtiQ@mail.gmail.com>
 <lmntn442hpprtvhxifxqdycpcqhjcl2oz4fp2egozv5vb7c75v@nm7nojxkmtkh> <CA+5PVA43pmNLaZz2rWkWRvyYJmjVqzbjaDVSLrvcvkY0NwwTow@mail.gmail.com>
In-Reply-To: <CA+5PVA43pmNLaZz2rWkWRvyYJmjVqzbjaDVSLrvcvkY0NwwTow@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Apr 2025 09:46:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7=hshod5He1q4uEdH6d5pLwPiDNCyfe3_29EjESsmypw@mail.gmail.com>
X-Gm-Features: ATxdqUGQ40uvigj4BWOEmye3gbQTEK9toP3DuaNpG5pA_PauZbUzPVzvSyH70wA
Message-ID: <CA+5PVA7=hshod5He1q4uEdH6d5pLwPiDNCyfe3_29EjESsmypw@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Zijun Hu <quic_zijuhu@quicinc.com>, 
	linux-firmware@kernel.org, agurenko@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:49=E2=80=AFAM Josh Boyer <jwboyer@kernel.org> wrot=
e:
>
> On Tue, Apr 8, 2025 at 8:46=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Apr 08, 2025 at 07:59:40AM -0400, Josh Boyer wrote:
> > > On Tue, Apr 8, 2025 at 7:43=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> > > > > Hi linux-firmware maintainers
> > > > >
> > > > > Here's a pull request for btqca bluetooth driver. Please let me k=
now if
> > > > > you have any problems.
> > > > >
> > > > > The following changes since commit 41a528251649772edbcb705a40e617=
fd14858e53:
> > > > >
> > > > >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49=
 +0000)
> > > > >
> > > > > are available in the git repository at:
> > > > >
> > > > >   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> > > > >
> > > > > for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefb=
d8ce76:
> > > > >
> > > > >   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17=
:18:24
> > > > > +0800)
> > > >
> > > >
> > > > Josh, it seems this pull request got ingored / skipped by the robot=
.
> > > > Could you please take a look?
> > >
> > > Thank you for the heads up.  There was a merge conflict in WHENCE tha=
t
> > > I manually fixed up.  New MR here:
> > >
> > > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/51=
0
> >
> > Thanks! It seems check-commits errors out on merge commits.
>
> Yeah, which is weird.  I haven't run into that before.  I'll poke at it.

Now merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/510

josh
