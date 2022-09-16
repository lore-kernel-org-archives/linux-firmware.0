Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD82ECAAD8
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 13:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 150ABC43140; Fri, 16 Sep 2022 13:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1225C43144
	for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663335197;
	bh=ZD3n2TQOc3Hh7AhSXo4K4KyU6kf8eoxhbXCM99vDqf4=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=tE7Xfu71NwwT4MmuFxM88ukj7Lr6Jy+HWK077jTOtBURMPl7hjmCUw7gd2H//Us+v
	 S6yE02RanJouV6avIoaTC/kWi1GbqYeN9OirZdYoX0/kpUa3YWFa5oea83n+KdF9pa
	 MqrBwx5oEciKKQNJVMt5EJxR9g+ueirnXeXGtd6qGDJEqXIkwXrjOfcePc3TeXY8R4
	 gUS5WfLB8OwNZ1GaHl/cvXi3cfGdq3QRsL11bbn2Qcl95ZDwgI2/Gnw3ddnlgJ/0xn
	 anDDnLxV/usIHRAaW6kcaLfhbuX6Q91Led1UaxyOVue/2VA8s0UJx/CDPPDYoRAulN
	 rdf7LUdsTXr1g==
Received: by mail-oi1-f179.google.com with SMTP id u131so6172828oie.5
        for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 06:33:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf00vjyPf7P0yUZM4tRzWc6R60S2ktycAzZLjsTaOAZhVgmsQIj5
	ncDgHAOKU0u1FvYRSWUNJZbLco7wLKfDKCtQXuk=
X-Google-Smtp-Source: AMsMyM4yVKVwzr+eOvVjAwZZKARvxJWK8lrX19voMiFu771yhvkRCr6ympz/A2u0XxqDsTCczlXdKdCUrNRayMJVumU=
X-Received: by 2002:aca:4144:0:b0:345:7285:1141 with SMTP id
 o65-20020aca4144000000b0034572851141mr2365821oia.267.1663335195819; Fri, 16
 Sep 2022 06:33:15 -0700 (PDT)
MIME-Version: 1.0
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Sep 2022 09:33:03 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
Message-ID: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
Subject: linux-firmware signed commits; does anyone care?
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, 
	Juerg Haefliger <juerg.haefliger@canonical.com>, 
	Peter Robinson <pbrobinson@fedoraproject.org>, Takashi Iwai <tiwai@suse.com>, 
	contact@laurentcarlier.com, mpagano@gentoo.org
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>, Jared Dominguez <jaredz@redhat.com>, 
	Alex Deucher <alexdeucher@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Some time ago, we went back to doing ~monthly releases for
linux-firmware primarily to help distributions package firmware in a
simpler manner.  We GPG sign the tarballs, as is good practice, but as
part of reintroducing the tarballs we also started having a
linux-firmware maintainer GPG sign *every* commit done by a
maintainer.  The intention there was that because we're dealing with
binary blobs we really have no recourse to see changes unlike a source
code repo.  The signed commits at least provides a measure for
interested people to ensure the repo itself is only being committed to
by a recognized maintainer and it isn't compromised (in theory).  The
downside is that pull requests are merged non-ff and we wind up
signing the merge commit.

The question at hand though, is does anyone care about the GPG signed
commits?  It's not clear to me this practice is even noticed nor if it
is bringing any value to this project.  Since we've started this
practice, I am literally the only one committing to the repo and while
it isn't hard to do I want to know if it's actually useful to anyone.

I ask for two separate reasons.  The first is that a group of
interested firmware submitters is looking at modernizing the workflow
for the linux-firmware project and moving to a merge request workflow
instead of submitting giant binary blob patches via email.  This would
allow us to put some CI in place for simple checks to the WHENCE file,
etc.  Doing this while still having GPG signed commits isn't
impossible but it certainly complicates things a bit, and would likely
require a trusted bot to sign commits.  That has implications on
secret storage and changes the dynamic on trust levels that make the
whole thing even more questionable.

The second reason is that even if people are validating the GPG signed
commits, it's not exactly user friendly.  I've been looking at
sigstore and recor and that might be a better solution in the long run
if we do want to utilize something like the current scheme.

I'll still GPG sign the tarballs, but I'd like to propose dropping our
current self-imposed requirement that all commits are GPG signed.
Thoughts?

josh
