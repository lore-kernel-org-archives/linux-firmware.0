Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B61CA0EE6
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 11:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A7B3C19424; Tue, 19 Aug 2025 11:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7504CC116D0
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603530;
	bh=EKTaAMTv0tjhCL9X91FCAR/7cCNRWPptQcXMvXF3gqY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YbI9vGWtgC+2bOjbOucVPBfPxIvNUYdNwY8SGp0Du6wKncks/EuaVbSTIyQbRtSxY
	 ladPzLVVNRViJHWHyvsHdVO1ad+G2CdTKOHDDgP3VWm9XMV6xHdL+rayfQVkEozw5i
	 TbOO7haoeHvdSAv6nQbKEHX/bojwIqs/EeFPp/AU6CTqdA4m4yx7vWet+ckJgZHON9
	 WkDfR4I4sMx37dTAl04kSuffRMJZEETh8ks90POOpms/dga4VUPOwmt4qtioaI2AW7
	 WH8iPxt53F0eSZJXX+Qh7kz8V+JoyKhzln5LraZq5nTLKTGzufLoCO89zrCIIPWLGp
	 SKDJJFXpiJWJg==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e94eb6b811aso279200276.2
        for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 04:38:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVN4xQJPUi6LYsH3W6K2E8SWcEvlZ/G0ZjdyaagcDdZQnUVPMKnphCUAzDHbZDHXg5iPXJ0PcyRAsPS+vl2XQ==@kernel.org
X-Gm-Message-State: AOJu0YxIpCN0huu7XuvGtzRyKuHaKfNAyIfpM13c6wHzzWgdU5HT2skf
	wjtKOTvSrR2He3xKx7drqHJWAaw+E4jhNXpLrUvzxYQR/OM/nuPufzR71v5wnJKUe++sdf06puq
	O7Gk3/gN0VnRrOqp9sgU/viY+6DItjik=
X-Google-Smtp-Source: AGHT+IHjVF7QvjMJjcml6MBQjaEYTyfs/iaEKtmS2KHpvjgZvz3aRNrEWuE013ki6C6UW5rYnyLW8Q8pe5soxhuYduk=
X-Received: by 2002:a05:6902:108e:b0:e8f:e526:fda9 with SMTP id
 3f1490d57ef6-e94e61fa088mr2498494276.22.1755603529726; Tue, 19 Aug 2025
 04:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <c3f6d28b-c2a5-4b41-94e9-eb4e55a5e293@oss.qualcomm.com> <koqfvbpsoa63vsziseqineugehgxy5mzwase2xmvfr4v6rao2i@yz3pp3wgxnez>
In-Reply-To: <koqfvbpsoa63vsziseqineugehgxy5mzwase2xmvfr4v6rao2i@yz3pp3wgxnez>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Aug 2025 07:38:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7O=UKZTz2gx9FdTow8mTx12bdb0L9EnWeQmuHCvhxvMA@mail.gmail.com>
X-Gm-Features: Ac12FXyHNi2xczIbDd0oNMrvp8yuyXuQcWC9z6q78Ft0e1za87DbfdWmWe6Q26s
Message-ID: <CA+5PVA7O=UKZTz2gx9FdTow8mTx12bdb0L9EnWeQmuHCvhxvMA@mail.gmail.com>
Subject: Re: qcom: add CDSP firmware for x1e80100 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/647

josh

On Fri, Aug 15, 2025 at 10:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Aug 15, 2025 at 03:44:52PM +0800, Xin Liu wrote:
> > The following changes since commit 08ee93ff8ffa9e8caf2e048a47cdf010dd1b=
c12b:
> >
> >   Merge branch 'amd-staging' into 'main' (2025-08-11 13:13:29 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > cdsp-fw-x1e80100
> >
> > for you to fetch changes up to fec7a9678d1cab182d618ab5fa3919779c0e6230=
:
> >
> >   qcom: add CDSP firmware for x1e80100 platform (2025-08-15 10:22:15 +0=
800)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
