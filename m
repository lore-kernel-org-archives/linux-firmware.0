Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E80FC35FFC
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 16:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08A34C4CEE9; Wed, 19 Mar 2025 16:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F31C4CEEA
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742402567;
	bh=SRYemCxLan7ei9d6fAAgqVu3/7Lrn6/WlEKNT2To2TQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jIq+oMgfKWBJxGXSFPEKugZ/wAnbOsO5r5xHXQWv6VXAjKirr0u4xI2WUihwHWCV4
	 05wvhPaiKqIUdHOLQJa25ZdvVSn9Bck60fu27fdY2/JhST+6xdpJiWDliKqcBZOHh2
	 UN4qpir531EoRCQFvKHsJc174Eu2wwaa5/4rLDjrdudNbqzMIJPLit9qhT2rqoaU6H
	 aOeBCoCgdV9Wx5hkz5Qb7Mbbj1sZhPwAUUSa1BY7fql+aGWWyGV9NshsSvU4wZuKZv
	 eRQZH8ycW7CX5bJK4J0qsbxhSlV6V/IP2uZbkHLoAP19HzaRmovSFchZlN9PM3DsL8
	 jhDnMKmhhmG+w==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e46ebe19368so5854872276.0
        for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 09:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHBgAcDh4YgStITMh+PWEq9dZGr6KEvJsooar5yMsL+jMt9gv+8/ejuSdOdbvRC9k1VQ6wuZuUx7RbCP1OVg==@kernel.org
X-Gm-Message-State: AOJu0Yw7RoIKm9jnLkRJOeWUI+3KWGxAwS2WqgluwvHpvKOmXZsg3mvf
	Or2Xy4tJBydTGp9ZKabkwPAeMuasvqGIwa5WIjYf7TieuiO60k43BlDtFFkjZKXJQkN8/UFLpGI
	zaV2veSPAq6HZhetAYKob+oll6Xg=
X-Google-Smtp-Source: AGHT+IHecy7M4N6wH2CNpSSShq2OJlCtbsFTyiPXfeLrEmCwHVlfINntYYkxeEvAeMj2neT/H8uOhxGbQt6zcxLhqCI=
X-Received: by 2002:a05:6902:110b:b0:e5b:22d5:307d with SMTP id
 3f1490d57ef6-e667b44696emr3777476276.33.1742402567038; Wed, 19 Mar 2025
 09:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <01872bb9-682e-4069-919d-3812c7bf3226@quicinc.com> <qecbhpoxqw3k6ua25ua3o7ygwiu3x2klr4vnln4sedenmmpeeb@nvdczbvesh7b>
In-Reply-To: <qecbhpoxqw3k6ua25ua3o7ygwiu3x2klr4vnln4sedenmmpeeb@nvdczbvesh7b>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Mar 2025 12:42:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA59bN48_GeKZBGpBpxphfiPmBZfN_Y3MBVNa4JV+9m=Ng@mail.gmail.com>
X-Gm-Features: AQ5f1JpwPe59HPMD5faEnmcsXcGVMIeHEzqyaDs57FC81e4iBC9NWykVT4Yts10
Message-ID: <CA+5PVA59bN48_GeKZBGpBpxphfiPmBZfN_Y3MBVNa4JV+9m=Ng@mail.gmail.com>
Subject: Re: qcom: Add DSP firmware for QCS8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-firmware@kernel.org, 
	"Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>, 
	"Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/494

josh

On Wed, Mar 19, 2025 at 11:42=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 19, 2025 at 09:10:34PM +0530, Ekansh Gupta wrote:
> > The following changes since commit 430633ec9398a44575ed86f92e36541d5fee=
bdd6:
> >
> >   Merge branch 'robot/patch-1-1742367326' into 'main' (2025-03-19 11:10=
:14 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw=
-qcs8300
> >
> > for you to fetch changes up to bd50c4979e4edd2f23b40c9dace8f9c05c807bb0=
:
> >
> >   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 21:03:57 +053=
0)
>
> Thank you!
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry
