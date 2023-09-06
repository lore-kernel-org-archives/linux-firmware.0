Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8ACEE14D0
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 20:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D4C1C433C9; Wed,  6 Sep 2023 20:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2640CC433CA;
	Wed,  6 Sep 2023 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694032949;
	bh=7pXsLZ14TOtOA2hAHgdu0eciyyLYS1REY8luBNyTSRY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GfdUBO30+0LytKHYTsvBHCNT5NrcIxwJC/sct5kXJSaXFsiuUDanHl7ynJdwliRrW
	 3bXCpYw1jHbF63yMuInGimCl3c2vDixqFcYsg7A/gE6mxxTKDuzvsjBcD9J3T3QQka
	 r9PrARNF/fvCzz5/TKFYBG5ZEzWnZ+GwZx5BipoRqinqib7gyfdjgmoPi0zCOJXlkB
	 l/UtzFV/UBF1Ap8HAvse1UBUKhgrrMGo2cC2+4gKebXVbaJXOlaS7yeBP9pHEVlUae
	 M4PGo0CArBKPbzPohuodVaWy1L6UL503NU67QcUr1Aa01YEl5X1hLpI3FDXpQBsBp1
	 AtRDCsdk6Wmcw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-58d41109351so19037357b3.1;
        Wed, 06 Sep 2023 13:42:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YwB2CrBPp5Sit2mDUaL6E/tHm3aHu0VJOg5gGArvMtQsjGhu5k0
	zatxelYjoD1aea2pFr5S20vk1whcEcfl6UuaehQ=
X-Google-Smtp-Source: AGHT+IH1gwJu89FklVzfSCZbNKJP4sJpXOS/vUu4X25j2OJv28fewjV2z8VFtXCbkYGhVtfNYb8JdON4hs1kFjCSKos=
X-Received: by 2002:a0d:d655:0:b0:583:8c61:de8 with SMTP id
 y82-20020a0dd655000000b005838c610de8mr834545ywd.16.1694032948121; Wed, 06 Sep
 2023 13:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org>
 <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com> <CAA8EJpqTd20xGZFpgsA=yoQELonn4QtOwAE6OX9abmv01SWDpA@mail.gmail.com>
In-Reply-To: <CAA8EJpqTd20xGZFpgsA=yoQELonn4QtOwAE6OX9abmv01SWDpA@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Sep 2023 16:42:17 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6gw4j39Q3srA8=8YtVkvm_xH=KQ1Ma9rPHA=prTz_eqA@mail.gmail.com>
Message-ID: <CA+5PVA6gw4j39Q3srA8=8YtVkvm_xH=KQ1Ma9rPHA=prTz_eqA@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 7:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 6 Sept 2023 at 14:17, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Tue, Sep 5, 2023 at 8:02=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Please pull in firmware files for new Thundercomm boards, Qualcomm Ro=
botics RB1
> > > and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, =
video
> > > en/decoder (venus) and Adreno GPU firmware files.
> > >
> > > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191=
a8ddb5:
> > >
> > >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmwar=
e (2023-08-04 06:33:54 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/lumag/linux-firmware rb12-fw-v2
> > >
> > > for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632=
be:
> > >
> > >   qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-=
08-23 20:24:47 +0300)
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Baryshkov (5):
> > >       qcom: add GPU firmware for QCM2290 / QRB2210
> > >       qcom: add firmware for QCM2290 platforms
> > >       qcom: add firmware for QRB4210 platforms
> > >       qcom: add venus firmware files for v6.0
> > >       qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
> > >
> > >  WHENCE                    |  27 +++++++++++++++++++++++++++
> >
> > This conflicts in WHENCE now with the addition of the RawFile type.
> > Can you rebase on top of the main branch?
>
> Done.
>
> The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade9=
01:
>
>   Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +000=
0)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb12-fw-v2

Thank you.  Pulled and pushed out.

josh

>
> for you to fetch changes up to 74cc8ca8217cb0967ade52953f9d9242f09e3460:
>
>   qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
> (2023-09-06 14:30:16 +0300)
>
>
> --
> With best wishes
> Dmitry
