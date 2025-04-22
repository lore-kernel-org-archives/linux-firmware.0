Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFECC369C2
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Apr 2025 11:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9457AC4CEEE; Tue, 22 Apr 2025 11:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3DFC4CEEA
	for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 11:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745320704;
	bh=qJpMp2BEjDFJx9rD/b8bafrGMZnXQd9ZVbbwUqwYTv0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EQ02T6G/xpTle1zhvMl78muELkolHGqXw7A+DWQ0TGHy4MwlViOF/cCLIybNm4X/F
	 BJsCdq03b/joFfcY6qFea85XRtnojPh77a8hcT5Xm5Lnj0tcNVnECiE/ZQ+KF8nLoH
	 +4olx6Ho4cEBqSiUTClIo1pFCf3Uvj5ALlfAb3husu01QnTjAoIKA7rKqFwUGknMRg
	 gVi7TKsUvgnbxh4FA2mY4E5oe6CvLOgnUtrXjJZyq7u34i2LkBawfAT0wxuQeeZhte
	 J297k3X+XmqhfDYWjpn8X7iWJLI78bKGvse/LeCe+y7Jx9kCS0vOAtbsbRFO5fITTd
	 +5OOGBa+CSv+Q==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7040987879so4537028276.2
        for <linux-firmware@kernel.org>; Tue, 22 Apr 2025 04:18:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxpcb1QYcf5PrHgWxAFonqoomjh7vqXxkyRyPofS2TgxQK5zwa/
	Gieq48hvT8xI+myPJcQ2JKO2OSczLpppq3x8gvK2AcsIOj9oS3SOf3xhxLJoALrP7TGWJaSKZtA
	9Pqc7lV+PBE8uZtwMVG+P9+pLjz8=
X-Google-Smtp-Source: AGHT+IFXhJdYdckHO6EG9Q6S2l2Tqtkj3m37Yq3OL5twzmh7E3qG5OblHeFZSfm9JgyehUJo207Zk71wB5BTmojg+JM=
X-Received: by 2002:a05:6902:2503:b0:e70:a909:1ae6 with SMTP id
 3f1490d57ef6-e7297db6de7mr20740961276.17.1745320703718; Tue, 22 Apr 2025
 04:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <3e568e90-2c9a-4e66-b6fd-6bc63c7e9aba@quicinc.com>
In-Reply-To: <3e568e90-2c9a-4e66-b6fd-6bc63c7e9aba@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 22 Apr 2025 07:18:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4+gBgb8ghXTBo9a9L78vF9b2eOJ4kuSO4aWoSrgp-eVg@mail.gmail.com>
X-Gm-Features: ATxdqUEH-6Ah1mQ1Jw8Zbx8UnSJCKlDWn7QCpYHAnfRropXV_DF91vShUKgBJms
Message-ID: <CA+5PVA4+gBgb8ghXTBo9a9L78vF9b2eOJ4kuSO4aWoSrgp-eVg@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCS9100 platform
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 6:53=E2=80=AFAM Viken Dadhaniya
<quic_vdadhani@quicinc.com> wrote:
>
> The following changes since commit 45104fd3c5a42e8a608f234b160f3228883fca=
1b:
>
>    Merge branch 'robot/patch-2-1745241474' into 'main' (2025-04-21
> 13:20:06 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-sa8775p

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/524

josh

>
> for you to fetch changes up to a940769c60a809fdc3daeb42550214f7aab35792:
>
>    qcom: add QUPv3 firmware for QCS9100 platform (2025-04-22 16:19:20 +05=
30)
>
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>        qcom: add QUPv3 firmware for QCS9100 platform
>
>   WHENCE                   |   7 +++++++
>   qcom/sa8775p/qupv3fw.elf | Bin 0 -> 55909 bytes
>   2 files changed, 7 insertions(+)
>   create mode 100644 qcom/sa8775p/qupv3fw.elf
