Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C805AD15D87
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Oct 2024 12:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91248C4CEE6; Mon, 21 Oct 2024 12:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B38BC4CEC3
	for <linux-firmware@kernel.org>; Mon, 21 Oct 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729513572;
	bh=fMyA6kqav768oJZZGRgOaKzEwnO7pk02cx0aOyZpwLc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qAtB7zotTIcViIocMwHjW8j/AryMjITYJqmXr46MCJpCmTqHCsJnLXJHQJ5eTkU8S
	 yb2ou51WqiOJOsvxYhWHb3G36qd+sAE2zQbSvCh8JK/15dBpoaFgDsM0vBC9xceTBQ
	 Y76DciO+QRSc+yN2DpScnrvKD8EWr9zhx0eGYC22Vlg2cRGZxghMzn7VIft8rPMvfS
	 uJKsvD9x/d+DKOZik7fYdxdfZSWwVHkq7Zd4JRlIt4iHC4HIOMS4hcBXKatscHO3xG
	 Nf0toIKuyVf5gRcn/vujcnzm9Dlu/ZWBy4nYs5Ez9EaVxXi7ZfnWycfcNKGxYuGz4G
	 J2Dauyg6uW6jg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so31908797b3.1
        for <linux-firmware@kernel.org>; Mon, 21 Oct 2024 05:26:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZsItCoszgH1dRS46PF+C25Xcr6q6OhwLtLBDzsTmJMufPSweC
	HddS9qzX9d91Hw0UnjXLeJeTkxhmNOk7Osg93OX6YlYY7DivhqctSFsgpXIQcVIgUvxZ4yM57Qe
	ZQn7o8b1c+/IQPnmFiBD9YeYhmJw=
X-Google-Smtp-Source: AGHT+IE+W4emy/o6+SrBKeLp6lrX0xqacA4SQ6gw0mRguYiRnmP+nBB1U0/qvBk629uxHk3ek9xdMGgY7Ia/XTzx5wY=
X-Received: by 2002:a05:690c:d:b0:6e2:f32:bd2c with SMTP id
 00721157ae682-6e5bfc0c83fmr104383847b3.29.1729513571644; Mon, 21 Oct 2024
 05:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
In-Reply-To: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Oct 2024 08:26:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7TiDoG-OwSZuj1M68bnVP__trM9EfqTrAN5xsDVOnzWw@mail.gmail.com>
Message-ID: <CA+5PVA7TiDoG-OwSZuj1M68bnVP__trM9EfqTrAN5xsDVOnzWw@mail.gmail.com>
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 3:14=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.com=
> wrote:
>
>
> Hello,
>
> The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b2755570955=
58:
>
>    Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17
> 15:40:04 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> adsp-fw-x1e80100-crd

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/337

josh

>
> for you to fetch changes up to e1ebc2c9b9956f4115853c9feb07c56957503418:
>
>    qcom: Add Audio firmware for X1E80100 CRD/QCPs (2024-10-18 11:48:47
> +0530)
>
> ----------------------------------------------------------------
> Sibi Sankar (1):
>        qcom: Add Audio firmware for X1E80100 CRD/QCPs
>
>   WHENCE                     |   7 +++++++
>   qcom/x1e80100/adsp.mbn     | Bin 0 -> 22235528 bytes
>   qcom/x1e80100/adsp_dtb.mbn | Bin 0 -> 73528 bytes
>   qcom/x1e80100/adspr.jsn    |  22 ++++++++++++++++++++++
>   qcom/x1e80100/adsps.jsn    |  22 ++++++++++++++++++++++
>   qcom/x1e80100/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>   qcom/x1e80100/battmgr.jsn  |  22 ++++++++++++++++++++++
>   7 files changed, 102 insertions(+)
>   create mode 100644 qcom/x1e80100/adsp.mbn
>   create mode 100644 qcom/x1e80100/adsp_dtb.mbn
>   create mode 100644 qcom/x1e80100/adspr.jsn
>   create mode 100644 qcom/x1e80100/adsps.jsn
>   create mode 100644 qcom/x1e80100/adspua.jsn
>   create mode 100644 qcom/x1e80100/battmgr.jsn
>
> Thanks,
> Sibi Sankar
