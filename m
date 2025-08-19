Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EECA0EEB
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0051C116C6; Tue, 19 Aug 2025 11:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B640DC113D0
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755604265;
	bh=eXDRC+vUoNvV6aKHnn7mY/0housgXJy8XKvazPruCD0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bbsDsMkrtlgmznUW3VdhWMONx6Hvj0uUEyjOiCoGw3z72nyyq9oOLPgdSQOJtgLNc
	 u811Trv5iM7BACm6L0KIIdb6CDiUKL5LdDCIlsID5WnZWrksfmAEda4b2WToOpTF/q
	 5+9dNsslxDUaCj+Kav8GDBlS3ByTjrp7sPENNTyKs9NYYWWLRYkmQHSWYK5kNQXLQG
	 0Cat4NPBfS8dLAADKiqRF6codJhi67bl00V49fd9niw/0NI6eCE/SaScx0+U7xuIBQ
	 AZYawY+YkS1k1S0bQq2zNdS4KgdeNOl9A0VrC72ne1wZ0QZqk2LTesCo+1VakjODJw
	 btcBCk2bebMsg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71e816e7f09so18091617b3.1
        for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 04:51:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyCjRJ3Y80aqDiSI8FN1DLIpXGxYHyeSFz/T8x8uZWYUjmf1bi0
	JS9tbInBhM/CeFUfi13rC9K1n+QBk4CfeOSqpkYPYPLx0sQxJUh/SYq2a5e3+TP/i1Wt/3bAoie
	MrF6nkeZR18vz20ON5UZtSFYZgem3s1M=
X-Google-Smtp-Source: AGHT+IHhwbejUOjMEPjFXCcxGq5wXLsYwz2hKjPKaqpEOL2Pd19hksOQ5fkOpYUbqfcfpP6z2Q6fz9P3+I07sFeoh1k=
X-Received: by 2002:a05:690c:7444:b0:71b:9213:a75d with SMTP id
 00721157ae682-71f9d5840e4mr24623917b3.18.1755604264954; Tue, 19 Aug 2025
 04:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
In-Reply-To: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Aug 2025 07:50:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
X-Gm-Features: Ac12FXzN1rCGznpnl-iy_5ib-vx_-ITNcQA3yh96qcS40vVlPCDAhn0VxkNMa9g
Message-ID: <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 1:50=E2=80=AFAM Xin Liu <xin.liu@oss.qualcomm.com> =
wrote:
>
> The following changes since commit 72a326cda49109765396e08f2453c51a852e3e=
c6:
>
>    Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cds=
p
>
> for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
>
>    qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800=
)
>
> ----------------------------------------------------------------
> Xin Liu (1):
>        qcom: add CDSP firmware for qcs615 platform
>
>   WHENCE                |   3 +++
>   qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
>   qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++

Your change to WHENCE has a weird File suffix:

+ RawFile: qcom/qcs615/cdspr.jsnFile

This causes check_whence to fail because the file name is wrong.
Please fix and resubmit.

josh

>   3 files changed, 24 insertions(+)
>   create mode 100644 qcom/qcs615/cdsp.mbn
>   create mode 100644 qcom/qcs615/cdspr.jsn
>
