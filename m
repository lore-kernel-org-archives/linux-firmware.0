Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B5FF46112
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Mar 2026 13:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F8FAC2BCB5; Mon, 23 Mar 2026 13:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5BAC2BCB3
	for <linux-firmware@kernel.org>; Mon, 23 Mar 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774273585;
	bh=UUpxMBMi52ZjIU8vXsta6Wx/rc2TPx5fp3grrHy2DRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=f2XdAW75a3bXYBN/QgT5UZRVVAitA5L1JfBnFvYhtxuehTo9CM5rMKHW0ObOBiIJ3
	 PRadWrxeZKIw2LCukGXVGWnSbfu9GNKYg6ghlUqSQ2Uf/kwX51L2gkFhkAULKRvMid
	 5xuZJwxxt14ku+6IL+RGhY28sbe0wkA6gEyK7SWeiyKR6tDFh+doi5gdsPc8fOv32n
	 /QpYAgHaoeuBJNekNwWRWBf3uX6WJ/SVWTFk203DPbXhUekNN7AXXRpgzqb+/4rYE9
	 bja+uKxmK+buG9KuL110YN4TY0MTdkbXJmM9pu157GtxK/ruOARQmGpu4Ivzvyw64+
	 H9PUhFk8yRMPw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so35028667b3.1
        for <linux-firmware@kernel.org>; Mon, 23 Mar 2026 06:46:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHrdGmMbW2ivsrF34nryfBJqiWjoYecid3PCpHs/AtYcvsXuFe
	l5tu23vpafy24Nq1838MjEp05mrbYd6DrRjqDjhJXdrKJpc2Ydr8DBzkzheMywzsNnsDaYHc7vJ
	IKtjAZt7xYtTq41rUt0MUEXCfNR/JYy0=
X-Received: by 2002:a05:690c:6e81:b0:79a:3a33:94a with SMTP id
 00721157ae682-79a90ac3494mr125629217b3.4.1774273584572; Mon, 23 Mar 2026
 06:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <005801dcb6fb$890ba300$9b22e900$@opensource.cirrus.com>
In-Reply-To: <005801dcb6fb$890ba300$9b22e900$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Mar 2026 09:46:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5AMgxkJyUYBNnhj0T_Ow=KCkdLM100rEW_mOG0J_G_0w@mail.gmail.com>
X-Gm-Features: AaiRm51g4eIua2U25LgEWVguoyJrgAfbsKe-j_G75sp7oxCMr6hP235oPROjjLk
Message-ID: <CA+5PVA5AMgxkJyUYBNnhj0T_Ow=KCkdLM100rEW_mOG0J_G_0w@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus Amps for some
 Dell laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/965

josh

On Wed, Mar 18, 2026 at 1:20=E2=80=AFPM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> I couple of patches today - we=E2=80=99d like to update the firmware for =
the Cirrus CS35L63 smart amplifier for some Dell Laptops.
>
>
>
> This series includes a Fixes: patch for some incorrect filename links in =
WHENCE.
>
>
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 66ca9a5b63a5b7ee14ca382f6b5a21a72e0a36=
98:
>
>
>
>   Merge branch 'robot/pr-1-1773782672' into 'main' (2026-03-17 22:15:12 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware 20260318-cs35l63
>
>
>
> for you to fetch changes up to beb9508e0328462712e1c277f9daa028fe5e067f:
>
>
>
>   cirrus: cs35l63: Update firmware for Cirrus Amps for some Dell laptops =
(2026-03-18 16:37:55 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (2):
>
>       cirrus: cs35l63: Fix Cirrus Amp firmware links for some Dell laptop=
s
>
>       cirrus: cs35l63: Update firmware for Cirrus Amps for some Dell lapt=
ops
>
>
>
> WHENCE                                                  | 250 +++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++-----------------------------=
-------------------------------------------
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 11440 -> 11=
440 bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin | Bin 0 -> 11440 =
bytes
>
> cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin | Bin 0 -> 11440 =
bytes
>
> 29 files changed, 110 insertions(+), 140 deletions(-)
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bi=
n
>
> create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bi=
n
>
>
>
>
