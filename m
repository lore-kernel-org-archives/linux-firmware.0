Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EDCAC59A
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 19:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0010C4CEFB; Fri, 19 Sep 2025 19:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7BBC4AF09
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758310360;
	bh=haPBtKQ18vbjIkwcei37rGsNpgFbL5lOjLzuIxJqnEA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Jf8cHUtIQOn3pEXYLwNsWQSnHnGA3BEKElh4bPqhjXuzkCut50Dyc/7KNUmPyiJ5V
	 0JjaQjE5li5yN4bUkNUXbZsKYwqIIAKLxi528s0XW4AB7EuwCzs8BfY+OfxTQGwaKq
	 y20FeHWk3QbReRIBHRaXmcJ8GvaeeNUZtYH1WGziEbnm3dorXUH+eISCiezZcLauNw
	 k5ThC7eT7Nwu56YmR+iTuwtpsLgbxwt0TON605Pszu2UQj088RlTlYrF48oTV2uqBK
	 KhmSREK+RUxhn9jVt9y5FomKqsFJjWObf5OaEPcbQfEU/WXj3swBgIeE2xdBcrT5hD
	 fGwQHWQZWpbLw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60150590so16776767b3.0
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 12:32:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUffKgwkLzWNUZxlHrwpElxQVIMEmMPzPWrFr/vhXNzEeyQUVTg336Wg4thpUS8wtM8/sQFc+lyQoZJhxyccQ==@kernel.org
X-Gm-Message-State: AOJu0Yyzl2a8kyK2SmCndH2t3VdE0GV1cZUx3ZfbGkUcwLrnv6yCbY65
	nrQRffJmzsn1exYq4mrPF/PcJqfYi8icvxN/OVtL08wGyniB1PVTLOCZCYK1ZsPMpLL5MQwAsnw
	JRrRJ3M7ibCbjuMzuUd2lIuoNpnh4JdM=
X-Google-Smtp-Source: AGHT+IH+wQVIQchBQskeJsR1F8Tlgrypbo18OVaC/2a+WAFe+AXCsBPux2gYYr3pZFoxXv42tcgQbQCGX+bvepXpJ3Q=
X-Received: by 2002:a05:690c:7343:b0:723:97ed:b2d6 with SMTP id
 00721157ae682-73d376159e1mr40190787b3.24.1758310359976; Fri, 19 Sep 2025
 12:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <1fb5db0f-161c-49a4-a09e-d6b58427b0ea@oss.qualcomm.com> <gngd36jovqcg4ipyfl72vuif7wlcw62q2eaagw75vu5iy4z4ns@vbiqidgb7v64>
In-Reply-To: <gngd36jovqcg4ipyfl72vuif7wlcw62q2eaagw75vu5iy4z4ns@vbiqidgb7v64>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 19 Sep 2025 15:32:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4ZZwOjPyzCHoTsT4m-ssxfYdU7tXpiCr+1y1hgUXA0XA@mail.gmail.com>
X-Gm-Features: AS18NWA2joUvJf6vo41OiASdMwDVb3ta4tAjSFoufj-j24yEjBdBqrqCFblzPUE
Message-ID: <CA+5PVA4ZZwOjPyzCHoTsT4m-ssxfYdU7tXpiCr+1y1hgUXA0XA@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Venkata Kota <venkata.kota@oss.qualcomm.com>, linux-firmware@kernel.org, 
	ekansh.gupta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Sep 19, 2025 at 11:10:12PM +0530, Venkata Kota wrote:
> > The following changes since commit 3124a51452eb5ba129815583f5b3af5ec0ef=
5b26:
> >
> >   Merge branch 'robot/pr-0-1758219630' into 'main' (2025-09-19 14:31:28
> > +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > dsp-fw-sa8775p-dsp125
> >
> > for you to fetch changes up to 69c2e06617b78403fc06eb021fa9c0a33ab330d4=
:
> >
> >   qcom: Update DSP firmware for sa8775p platform. (2025-09-19 22:20:24
> > +0530)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/698


josh

>
> Nit: usually there is a space after the comma.
>
> --
> With best wishes
> Dmitry
