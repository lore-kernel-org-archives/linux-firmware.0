Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20415CD98F2
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 20:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0C9E1F00A3F; Mon, 22 Jun 2026 20:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4F81F00A3A
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782160864;
	bh=52JmVQ2KoLzRNuRQ6kxLbSGwc3Q52nf2k9XLlnpDt3k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=ZH4axK7afeIgykQYAOKPaHnuINpnS1saIP00ogH7vGNxIfnQvKJEYLyiN5SGVmjAy
	 CbHWk6qrURkOyM76ufaZLTKJS+PH3RsbMQKWMyWtyyi/P/kNmZKcsgh//riQ9xjPmW
	 2b9e4jnLhA+ASsiDT0r/WNtU67g8NsLzuaA2Rkny3HzO07OhRlPe9JzfMq5fiTc57m
	 nCUkJ05zMxQDhU5FwQMle2XT78DXD4FiERv2g5rFW7qQdfJtDw0SiS6hagt0x7irSv
	 5WyqrEQoT3orr36Pe5kaj7vcl3zNUkRLrH0qlGhKuAUKmcT1SH8sixSkdqS8EtCSP2
	 6ssDsk8oXBsFg==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662bb8b1f93so4769683d50.1
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 13:41:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YzYZe4Ql2BRGZ0ONMHYT+PGFuaynRzjcvfs4sRsHMypF6+DuWGG
	Uo4moWSPJSk7Y5zFWWU1V9jAzPgmXK1lv9VMtNlRQ5s4FX1728sSkEoHQPAeZqm+4Zpf5oB6ybp
	9xa3UnzNS9JHLcp4beUxI5fSZOLd5Nwk=
X-Received: by 2002:a05:690e:d0c:b0:661:75a5:3b5 with SMTP id
 956f58d0204a3-66359ef4dd0mr3944d50.4.1782160864196; Mon, 22 Jun 2026 13:41:04
 -0700 (PDT)
MIME-Version: 1.0
References: <45890930-775a-46cb-85e5-ffaadafd829a@oss.qualcomm.com>
In-Reply-To: <45890930-775a-46cb-85e5-ffaadafd829a@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 22 Jun 2026 16:40:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA46e=GXNjPBUc53cQZBmDGVz7_GGrLY9+Om16ObG3uKqQ@mail.gmail.com>
X-Gm-Features: AVVi8CfNU4_v_wWd133NRLB_oYkfClfZ_8c0yqWU4vJDdboqBw7GMPfAHVCYh_k
Message-ID: <CA+5PVA46e=GXNjPBUc53cQZBmDGVz7_GGrLY9+Om16ObG3uKqQ@mail.gmail.com>
Subject: Re: qcom: vpu: add Gen2 firmware binary for Purwa
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 4:45=E2=80=AFAM Wangao Wang
<wangao.wang@oss.qualcomm.com> wrote:
>
> Hi,
>
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d=
41:
>
>    Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>
> video-fw-Purwa-Gen2 for you to fetch changes up to 060aa3afb83c5f8c8e1f30=
ad0d9f8a2088718754:
>
>    qcom: vpu: add Gen2 firmware binary for Purwa (2026-05-20 14:43:45 +08=
00)
>
> ----------------------------------------------------------------
> Wangao Wang (1):
>        qcom: vpu: add Gen2 firmware binary for Purwa

This one doesn't seem like it's been merged and now it has a conflict
with main.  Probably needs a rebase.

josh

>
>   WHENCE                   |   4 ++++
>   qcom/vpu/vpu30_p1_s7.mbn | Bin 0 -> 2323048 bytes
>   2 files changed, 4 insertions(+)
>   create mode 100644 qcom/vpu/vpu30_p1_s7.mbn
>
> --
> Best Regards,
> Wangao
>
