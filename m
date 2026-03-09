Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C03FCA17E
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2026 19:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6AF73C2BCB2; Mon,  9 Mar 2026 19:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D46C2BC87
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2026 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773086122;
	bh=B7gnSoFXh0sx1718V4YZxfbgZ8BRR6El9ay1zD9PPes=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=K8dPY6zSqqmxNJg0k/s2yN4akIvMqTWGJEz4xjjsuoQDcpFUX10DBJ9VKcmBUoQ6y
	 Ng+UYfush+M8/wzolbDNdYvYDr6Yk3E69tXLFGM84RWAy64e6c+rPyYydQgHWDP/XO
	 AubBtQ/oORRY/Wasij7axyjBO6Ldu/pH8ASe3LrQSvqNRRUC5aRcrFTNK9sqyUErfl
	 wvnLS4bEs2sKI5SWWZ4kagG5YmPStHVhoryeOg31UXvQvy8JD3xfR3YdrOv+7QIn0F
	 9j8OKF91sgq5J+Oms9mDLks2pIw0ePFDDGqm43fmWQdQSaLPtFvSlKouUSx4eHpymI
	 cdtuQujXkTHsA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64aedd812baso10811472d50.3
        for <linux-firmware@kernel.org>; Mon, 09 Mar 2026 12:55:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxFds9W2oR5hjiHuKTyydwk7YeT8tSuo0SXEojfLVkDnpsRARci
	ZYGwVJ/XD03YvY4KMIHmorUBr43ByE5zk9DpwDgW0r/Mx7kz4aPbt9+jwKPAiOYAu0VPfr13ZQi
	+bCNigP5SkPxIBDQXc8lBD38UyUKkhMo=
X-Received: by 2002:a05:690e:1a9b:b0:64a:ee99:e50e with SMTP id
 956f58d0204a3-64d14333a3amr9440901d50.70.1773086121387; Mon, 09 Mar 2026
 12:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <000401dcafd7$977ccc00$c6766400$@opensource.cirrus.com>
In-Reply-To: <000401dcafd7$977ccc00$c6766400$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 9 Mar 2026 15:55:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6wBXxDQ+HMOZDMyp=v_s+LUmZMCPAq=XZHK8v8s=A5dg@mail.gmail.com>
X-Gm-Features: AaiRm52dywtqnDZYMfxbHJFpdI9jU_FJIsRV74S0ZFlpCAL8Mu56o87l4H0UYww
Message-ID: <CA+5PVA6wBXxDQ+HMOZDMyp=v_s+LUmZMCPAq=XZHK8v8s=A5dg@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs
 for some Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/950

josh

On Mon, Mar 9, 2026 at 11:15=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> I couple of patches today - we=E2=80=99d like to add the firmware for the=
 Cirrus CS35L63 smart amplifier and CS42L45 smart codec for some Dell Lapto=
ps.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit b3929cfcd543c4f388c4930175f442be94bbcf=
3b:
>
>
>
>   Merge branch 'lenovo-fw-rename' into 'main' (2026-03-09 14:21:13 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ 20260309-cs35l63-cs42l45
>
>
>
> for you to fetch changes up to 21d670224ad1f8ab2956243c0b381eed40338b45:
>
>
>
>   cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops (2026=
-03-09 15:08:59 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Maciej Strozek (1):
>
>       cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops
>
>
>
> Simon Trimmer (1):
>
>       cirrus: cs35l63: Add firmware for Cirrus CS35L63 for various Dell l=
aptops
>
>
>
> WHENCE                                                  | 361 +++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw                    | Bin 0 -> 28676 =
bytes
>
> 52 files changed, 361 insertions(+)
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw
