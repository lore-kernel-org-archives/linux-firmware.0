Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC490C25B10
	for <linux-firmware@archiver.kernel.org>; Fri, 10 May 2024 14:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C572FC32781; Fri, 10 May 2024 14:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFACBC2BD10
	for <linux-firmware@kernel.org>; Fri, 10 May 2024 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715352480;
	bh=ddVD8igRVx1DM8CaUk91RYi0f5k20TN3/O4bKysmewc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=N74YaQ4yIp0v9SF1O6vXIvXRbZK645HvB0Z3tODEcLi6YP0Isd4/WfU1Zb/XpV0Xm
	 a3AuJmBI8+nreVMuAKO/xY3FsVgs34PWQhkdb5fXdS8JD3QB8JNI7xt6+HgTfDKOUw
	 IoEkGA4/WDVcDGDl0DULsgl5bmZ56m2NjNujyYQF0Mrne2uoagxGB5U8pAdKpRC+wS
	 xBrd5fdguBP4msBUWygU+erqgEKBcd2oik6odYtY9Mxj8NLzbVsfSjgYhK1GtCykOF
	 OCWFZbM9fsZSz/Ys/gh8ehVmtF1UoibbWOf8mlZzMGU8VzMDwu45OV79RxmDob+Ti0
	 pVtcOcuTOFYcg==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2176957276.2
        for <linux-firmware@kernel.org>; Fri, 10 May 2024 07:48:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YyGe3sQVPCZXunx26EvO/x9HYGSBpHfA7+0s2+pqk51nYd5WN8Q
	Xf9Mk/Tq1BdlPl66fmBWrZJkf+H4cb/my3DdNULC/YWBXyaIjx6cOE1XmPN7xv+D+s+uEqjNxaP
	W9KOyboq6qmgqCxtC5m44XXjFXiQ=
X-Google-Smtp-Source: AGHT+IFiRya+LQl3Jj/Q9fKYTIRJ3EendYQLNYzt6dX+0QBwZXc4IpGrnOk0cf5DcI/YZsVQF6cYPffHUD4VOAMKHz0=
X-Received: by 2002:a25:b285:0:b0:de4:70e2:16c with SMTP id
 3f1490d57ef6-dee4f1a32a6mr2504738276.14.1715352479899; Fri, 10 May 2024
 07:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <04b84db4-8d51-4527-b393-d8a9b8cbee48@opensource.cirrus.com>
In-Reply-To: <04b84db4-8d51-4527-b393-d8a9b8cbee48@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 May 2024 08:47:47 -0600
X-Gmail-Original-Message-ID: <CA+5PVA5On9158yM8PFQwWNDU=Jgi1xD9tNO6vx=VquQxrUvZJA@mail.gmail.com>
Message-ID: <CA+5PVA5On9158yM8PFQwWNDU=Jgi1xD9tNO6vx=VquQxrUvZJA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add and update firmware for Cirrus Smart
 Amp CS35L41 for HP and Asus laptops
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 9:35=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for an Asus laptop, as well as updating firmware for a HP laptop.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit b93493c01691104b9a9b612f9e161702418d10=
a3:
>
>    Merge branch 'robot/pr-0-1714981108' into 'main' (2024-05-06 10:53:59
> +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ 2024-05-08

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/209

josh

>
> for you to fetch changes up to a43af4a3458d824b17c8bcadf8ee011629491d41:
>
>    linux-firmware: Add CS35L41 HDA Firmware for Asus HN7306 (2024-05-08
> 15:37:35 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (2):
>        linux-firmware: Update firmware tuning for HP Consumer Laptop
>        linux-firmware: Add CS35L41 HDA Firmware for Asus HN7306
>
>   WHENCE                                              |   5 +++++
>   cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid0.bin    | Bin 4060 -> 4068
> bytes
>   cirrus/cs35l41-dsp1-spk-prot-103c8cde-spkid1.bin    | Bin 4056 -> 4064
> bytes
>   cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-l0.bin | Bin 0 -> 4552 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-r0.bin | Bin 0 -> 4552 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-l0.bin | Bin 0 -> 4552 byt=
es
>   cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-r0.bin | Bin 0 -> 4552 byt=
es
>   7 files changed, 5 insertions(+)
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid0-r0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-l0.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431ed3-spkid1-r0.bin
>
