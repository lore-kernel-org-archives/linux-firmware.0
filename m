Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FBECA1015
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Sep 2025 13:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABB48C4CEF5; Thu,  4 Sep 2025 13:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9562AC4CEF6;
	Thu,  4 Sep 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993905;
	bh=9x2SkHcOreXiuQqlC6/KRQjV/21MzDezCnoULkIP14o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RTyzLZAlShPyFMtsi0UexVZQwVzGjbu6FaAINotKEdeRmWh3OUFnQOJ2r8ILqVxYL
	 KqwzGuTb0xSpqKziR9HhqqWOwzVeN9cWTLiB5J+5ihAnOUkYp7U0UkkwgJjUiwwQQx
	 fsySuk2OjkXaE+J7lJMEKK/xyKyMGhqnL7zlg/4VwpJ8wN7rJvmikoUA+AMCrcLO5P
	 +rtvjU4PSnZWNEUwikOzxLkhzDDPh1losU3yi3R/oM3DSAljJdRUtLSmTeb5EkUYjw
	 TM72JJZf2VP5aY+bzAXls3EgizEsV/WAk8ouMQ1YiGcJAAodWPblsfeb3QvL9Hcwyn
	 PU+dhRPh6p6mQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d603acc23so10228317b3.1;
        Thu, 04 Sep 2025 06:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdQ0HkB91olAxz41u9HkfyoQ2AIT5sWvl+OmgRWV8qIxT+saf0qDXLScnOPqYd/w3ZPUjKO/VFig==@kernel.org
X-Gm-Message-State: AOJu0YyOV47lxwQX0Mw/DXD+OCoztYjwwpU6shTlinJi71eKdJl3X0rx
	j5s7LbzmndZ1+tmaKwG6PYC94Gac5ra+1SRcpisGZKW6N/KWOS4VNawRC6TN9GQWNS/rVkqe5zQ
	qtZq5neLcd7LCtbGYHOXJ+OripeLbAro=
X-Google-Smtp-Source: AGHT+IHUQteiIw9Ozw+TIjzw0U8r2r786UvTNixegNiMm4NrZnyJI1jgfIFJjmUDUB2mMdHQd0hJ8pzqmoWzU/u07ug=
X-Received: by 2002:a05:690c:d85:b0:71f:b944:1039 with SMTP id
 00721157ae682-7227658c8bdmr198576107b3.54.1756993904817; Thu, 04 Sep 2025
 06:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
In-Reply-To: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Sep 2025 09:51:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA63eRdcFa+hNP7vScr+T-zCWDYRHe7PXQGqkyomV8=E-A@mail.gmail.com>
X-Gm-Features: Ac12FXzzi0Y-AYZKxADg5uVFx-x0HQZZynRywWYWLCPmNzu0XgUtI3XbES9OZGk
Message-ID: <CA+5PVA63eRdcFa+hNP7vScr+T-zCWDYRHe7PXQGqkyomV8=E-A@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath12k firmware ath-20250903
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 4:29=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 7d59b255fba6e1c3a4b7814c028cb9f8e83e14=
e8:
>
>   Merge branch 'mt7925' into 'main' (2025-09-03 15:36:06 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250903

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/678

josh

>
> for you to fetch changes up to 1c44d84a08bf0dfec147db6637aff593d7195b0c:
>
>   ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_=
V1.0_V2.0_SILICONZ-1 (2025-09-03 13:23:20 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTS=
WPL_V1.0_V2.0_SILICONZ-1
>
>  WHENCE                                 |    4 +
>  ath12k/WCN7850/hw2.0/ncm865/Notice.txt | 3386 ++++++++++++++++++++++++++=
++++++
>  ath12k/WCN7850/hw2.0/ncm865/amss.bin   |  Bin 0 -> 6111296 bytes
>  ath12k/WCN7850/hw2.0/ncm865/m3.bin     |  Bin 0 -> 299660 bytes
>  4 files changed, 3390 insertions(+)
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/Notice.txt
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/amss.bin
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/m3.bin
