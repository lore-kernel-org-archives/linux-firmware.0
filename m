Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B92CA0FED
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Aug 2025 12:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76862C4CEF4; Wed, 27 Aug 2025 12:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60091C113D0
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756299183;
	bh=5Mw1AkAhn/tHBo1OEb90nQqBgbsiijrn6fSBcAd538U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fVUSoR3jPl5qc8zZSXka9o+yy33HrZ0vqJ7SFwgu74JzsNODGTtBXS1KPlwIN8dYW
	 eu0KTVLOF8mduGZgL/hxDnMCIyyeH9ZunReV18b5ZowqmK1YeN3vFKfokXcANoongu
	 cfVc3lnQL4LNcv0yNGuF/fqKsesdQpJ2Nj2ogCQTLa/6GYbrYR44XA7l1uq2SS0nxa
	 1mLaxod9dWsvudahC+q1sfGx++JGKeBrN4O0DS0Cc86vgjdsC1Azz+vPRksbMJCny+
	 25k/tSJHFNTWvAuezOu2oZOUjUobK7v+qDSN9M7Ffbx+PWYFvhI7qE3AIX24JpS0Ux
	 zTuljaNy/7vTA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71fd1f94ad9so56039627b3.1
        for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 05:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvhJt4PI/LmHe5Aln5LwVI/D1GXO5T6Ng56mOahv5kTgM1+82zWPVa28M0G8fv+S/pi/mebwMNBp04qKSXng==@kernel.org
X-Gm-Message-State: AOJu0Yw9J5lyk+Md7+U45W3QjZ8+vcbWw/UxXQF5v/r4asf7DnZ9QzRs
	PZK06ph8tmvkasXh7RdHwMnnqg/OlqZCiHdYQvY/jqC6AxeZ1NwXEv+29iWbwnfmwFjq5hJpEap
	qz03ueXPTOKNUVlopidP4vFUP7Lh4ajM=
X-Google-Smtp-Source: AGHT+IFGNvWUMPZc6ltEwYwo7suBcC/pYFne+FfExRsOwH4l/JhpSclOQTtIRBTIM7kp5fGsLbD5nPrXhPBPwBFTUcE=
X-Received: by 2002:a05:690c:2504:b0:71a:2d5f:49bd with SMTP id
 00721157ae682-71fdc3155d0mr224188527b3.22.1756299182567; Wed, 27 Aug 2025
 05:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com> <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
In-Reply-To: <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 27 Aug 2025 08:52:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
X-Gm-Features: Ac12FXxxT0KMz-H5G-qGPf-O7S-5xlgZmgh7QSjEx1XKXVPCRwamSZxqxShYuTQ
Message-ID: <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
Subject: Re: qcom: add ADSP firmware for qcs615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 7:53=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
> > The following changes since commit f044bc789f8e7a4427593b687801644c39e3=
e8b7:
> >
> >   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000=
)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > qcs615-adsp-827
> >
> > for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2=
:
> >
> >   qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +080=
0)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Fails check_whence because the files have the executable bit.  Can we fix t=
hat?

josh
