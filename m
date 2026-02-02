Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FCDE7315C
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF575C116D0; Mon,  2 Feb 2026 12:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9148C2BC86
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034902;
	bh=p1UHjn3+SPY+T7iK+FrYM4ZUx6F0KvUGPdq7QXpAgq8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MJ0vJ+mFeTjq2zX++o7K52PpMWO4I36fAzTNs1sXYC5io7psDsIgchHlsJykSKJzB
	 xJay9TOmlX/X3m5ez83apJfOfHiJ47wj5COeyyD2G24lCAYDrZjPSOL8/QTiwzyPtq
	 bVZTMtzUyOmdDPkx52ZlnccoJ1cWszHbhykeYnUaVJpEj5vzHyADp7gd7yTFR5Nnjq
	 lg3RVrK7YYfHs/w7+JL43aj6KwIKbAAWLEMKwrOxMqMqiehPb3nTxLhiW7zujWa02p
	 M5kXqA6wUw+VEegi0uLMHKAQz/+0fVoDjTM2p8bdToJnNxZbNAueu9EbYMNjyV8URZ
	 4DwwcHJkUvPGw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794719afcd4so43394997b3.1
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:21:42 -0800 (PST)
X-Gm-Message-State: AOJu0YytWcouMEDtZDPtZNdp+UKICQnM1CJHTvMwGu5TNeV+zB4Y8kLm
	vf2FXXnjFyc3Dm00KCVl1ZI5SQllvYJN/WE6kAhQZGFnwqpHbYc/yEwbqM3gg1yxQ9B2A9ZAN2Z
	w3F9oDPkelBzrR/ykmF1YpjM4GASOtvI=
X-Received: by 2002:a05:690c:10d:b0:794:d639:396 with SMTP id
 00721157ae682-794d6393229mr23549467b3.32.1770034901829; Mon, 02 Feb 2026
 04:21:41 -0800 (PST)
MIME-Version: 1.0
References: <00ba01dc8c7e$23a13e50$6ae3baf0$@opensource.cirrus.com>
In-Reply-To: <00ba01dc8c7e$23a13e50$6ae3baf0$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:21:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6E51Ea-CQqupWbVSwEXSiDJaYGPciBc7aNrmFdw3DSQg@mail.gmail.com>
X-Gm-Features: AZwV_QhQQedzpPxC6wJQPa4yZZc4XAXP2iG6kuUQ825UEPrDDkmCK2DLTiWXJY0
Message-ID: <CA+5PVA6E51Ea-CQqupWbVSwEXSiDJaYGPciBc7aNrmFdw3DSQg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs
 for some Dell and Lenovo laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/881

josh

On Fri, Jan 23, 2026 at 10:37=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> A few patches today - we=E2=80=99d like to add the firmware for some Dell=
 and Lenovo Laptops that are using a variety of Cirrus smart amplifiers and=
 smart codecs.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 1b7b9f6c3461815b4f656178d31a6b6a90e045=
ec:
>
>
>
>   Merge branch 'robot/patch-0-1769048722' into 'main' (2026-01-22 11:51:2=
3 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware 20260123-cs35l56-cs35l57-=
cs35l63-cs42l45
>
>
>
> for you to fetch changes up to 53ec87319d287a837b1291a6c97ed93d759bd0bd:
>
>
>
>   cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops (20=
26-01-23 15:26:21 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Maciej Strozek (2):
>
>       cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops
>
>       cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops
>
>
>
> Simon Trimmer (2):
>
>       cirrus: cs35l56 cs35l57: Add and update firmware for some Dell lapt=
ops
>
>       cirrus: cs35l57 cs35l63: Add firmware for Cirrus Amps for some Leno=
vo laptops
>
>
>
> WHENCE                                               |  67 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++------
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin     | Bin 0 -> 10788 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin     | Bin 0 -> 10788 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin     | Bin 0 -> 10788 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin     | Bin 0 -> 10788 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin     | Bin 0 -> 10764 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin     | Bin 0 -> 10764 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin     | Bin 0 -> 10764 byt=
es
>
> cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin     | Bin 0 -> 10764 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw                 | Bin 0 -> 27872 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 10556 -> 10532=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 10556 -> 10556=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 12396 -> 12384=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 12388 -> 12376=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 12396 -> 12384=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 12388 -> 12376=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 12392 -> 12388=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 12388 -> 12384=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 12392 -> 12388=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 12388 -> 12384=
 bytes
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin | Bin 0 -> 12456 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin | Bin 0 -> 12460 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin | Bin 0 -> 12456 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin | Bin 0 -> 12460 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin | Bin 0 -> 12464 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin | Bin 0 -> 12464 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin | Bin 0 -> 12464 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin | Bin 0 -> 12464 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin | Bin 0 -> 12572 byt=
es
>
> cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin        | Bin 0 -> 13404 byt=
es
>
> cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin        | Bin 0 -> 13404 byt=
es
>
> cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin        | Bin 0 -> 13404 byt=
es
>
> cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin        | Bin 0 -> 13404 byt=
es
>
> cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw                 | Bin 0 -> 25808 byt=
es
>
> sdca/1fa/1028/db3/42450005.bin                       | Bin 10764 -> 13796=
 bytes
>
> sdca/1fa/1028/db9/42450005.bin                       | Bin 10764 -> 0 byt=
es
>
> sdca/1fa/{1028/db9 =3D> 17aa/2352}/1.bin               | Bin
>
> sdca/1fa/{1028/db9 =3D> 17aa/2352}/2.bin               | Bin
>
> sdca/1fa/{1028/db9 =3D> 17aa/2352}/3.bin               | Bin
>
> sdca/1fa/{1028/db9 =3D> 17aa/2352}/4.bin               | Bin
>
> sdca/1fa/17aa/2352/42450005.bin                      | Bin 0 -> 13796 byt=
es
>
> 62 files changed, 61 insertions(+), 6 deletions(-)
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin
>
> create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin
>
> create mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw
>
> delete mode 100644 sdca/1fa/1028/db9/42450005.bin
>
> rename sdca/1fa/{1028/db9 =3D> 17aa/2352}/1.bin (100%)
>
> rename sdca/1fa/{1028/db9 =3D> 17aa/2352}/2.bin (100%)
>
> rename sdca/1fa/{1028/db9 =3D> 17aa/2352}/3.bin (100%)
>
> rename sdca/1fa/{1028/db9 =3D> 17aa/2352}/4.bin (100%)
>
> create mode 100644 sdca/1fa/17aa/2352/42450005.bin
