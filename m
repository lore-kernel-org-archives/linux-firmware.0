Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB7FC47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40FE8C43390; Fri,  2 Feb 2024 12:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C142C433C7
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876918;
	bh=NwsvKvn+NfBOcfMYzhC7/512l6d6BU8DIYCh/pqaaVs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ckmXjMgB4F60XJOPu5gRS+/gueclwn3nu/1a0Wqcwn2gcLjUlt/fsFZa7fYc5D0kh
	 MOfU6CD1dKPk6YlZyA4BhMIuJ4aAMypYkEDKimJCE5lptMUWeWLNwUbYmMS5djL/3y
	 soTrPom15cFuYjIMrJCnlVgCpOI1sHixaQt96o5WAgVxKpv68SC1WiuRe2ROrnab+S
	 Dq0LcgSCPgR7GbtjTu4K7+OCphe6+0QlY1xiy+Mkf69h1ZZ5xzKLWjB/5mfRlhNZlk
	 jPL9WHau5te5hGSbp6afJTzsMy+coOfC07pgYITXK85j8EVKkeNpfeN4rl/SqdtFY8
	 9AWs3b4HG4j8Q==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60406da718aso20795457b3.1
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:28:38 -0800 (PST)
X-Gm-Message-State: AOJu0YwL+zJVPThyUAE5kTPsbCvyr17i0PSO4V+NDxc/wQ7QYNNi2Kvd
	x6s7w1GxBZUCInOqnIsD0ldsIiZpVtGBeWfNKKidAIjoCogNR7KAA0TsTn71GRP92HHIMk7BBTc
	j4vhq+4aTLvLo+wpcYwaDuJ32D2c=
X-Google-Smtp-Source: AGHT+IFGYrbwm00GynbseP5PAIFk/nVTLXYrOrpukW6WorNaaBQmBLps6XnI7iTUevJ4XkgwW76MX4BCdUAu/6AKtb4=
X-Received: by 2002:a81:af5c:0:b0:602:da5e:816b with SMTP id
 x28-20020a81af5c000000b00602da5e816bmr2145935ywj.32.1706876917333; Fri, 02
 Feb 2024 04:28:37 -0800 (PST)
MIME-Version: 1.0
References: <ZbrCw1AVnW6APq56@kekkonen.localdomain>
In-Reply-To: <ZbrCw1AVnW6APq56@kekkonen.localdomain>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:28:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5_WaVsVRzUbj04xrvgLvs2comQQhLrhcc08PkenMJ3xw@mail.gmail.com>
Message-ID: <CA+5PVA5_WaVsVRzUbj04xrvgLvs2comQQhLrhcc08PkenMJ3xw@mail.gmail.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 6 firmware
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 4:59=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi folks,
>
> This PR adds firmware binaries for Intel Image Processing Unit 6 (IPU6).
> The driver isn't merged yet but work to get it there is nearing completio=
n.
>
> Please pull.
>
>
> The following changes since commit 001ba06d9ded2a8e9a91f1824954bcb41f372d=
6f:
>
>   Merge branch 'robot/pr-0-1706638273' into 'main' (2024-01-30 18:39:07 +=
0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.g=
it tags/ipu6-2024-01-31

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/138

josh

>
> for you to fetch changes up to 1b24d7d3379b5dde99fcb17e796cdd5fe0a668bd:
>
>   linux-firmware: intel: Add IPU6 firmware binaries (2024-01-31 23:52:37 =
+0200)
>
> ----------------------------------------------------------------
> Intel IPU6 firmware
>
> ----------------------------------------------------------------
> Bingbu Cao (1):
>       linux-firmware: intel: Add IPU6 firmware binaries
>
>  WHENCE                  |  15 +++++++++++++++
>  intel/ipu6_fw.bin       | Bin 0 -> 471040 bytes
>  intel/ipu6ep_fw.bin     | Bin 0 -> 466944 bytes
>  intel/ipu6epadln_fw.bin | Bin 0 -> 466944 bytes
>  intel/ipu6epmtl_fw.bin  | Bin 0 -> 466944 bytes
>  intel/ipu6se_fw.bin     | Bin 0 -> 380928 bytes
>  6 files changed, 15 insertions(+)
>  create mode 100644 intel/ipu6_fw.bin
>  create mode 100644 intel/ipu6ep_fw.bin
>  create mode 100644 intel/ipu6epadln_fw.bin
>  create mode 100644 intel/ipu6epmtl_fw.bin
>  create mode 100644 intel/ipu6se_fw.bin
>
> --
> Sakari Ailus
