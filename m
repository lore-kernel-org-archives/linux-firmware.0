Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E852BEE14DF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Sep 2023 10:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7E7CC116B8; Thu,  7 Sep 2023 10:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9E2C4163C;
	Thu,  7 Sep 2023 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694082811;
	bh=T3hQRBP4n7g2/ff8/aoReglRWOiWDVjcLhJLTFH+4xs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mM1ScXY8HFApePCAzjpII7toyAbiMKqbjGTd7B46sB/o/mjm6IQKWZ0ZUSyFVlKrN
	 yQlUX0X83NH/K+2uOC0b9yzQasoBBqEO5DyRyoRXsc3GJUEPTAbaR0JHglG3gX9GXy
	 KWBUc0zeINmMV/eo/x1AmVCqE7HF5/A4akn9C+XPcstutxG9QhGjLMDM9tRtMKcGKM
	 LiGZZ8hT1I0yZfpdfVLKR82S6MUOeF+w5hAZJJNGBl1QhJZS7iv2IW8y2qwLEec8fR
	 fkM7Ohxs8ZSbT9nfcmuYvp1hUPEHYt1qo/EWtGkLD2/eWzh2SPdqvcTIATJw/xcIVm
	 Zcn2VU2wCxhjw==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c0828c3c2dso541847a34.1;
        Thu, 07 Sep 2023 03:33:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw5bxlJwpm55iovorgPQ0Z0c12uWRF6lAB01y4uyVtilfVDb9z3
	CKTeyFPpOCaS+CZ2h0K4AQufAdaVPcFh/ALmEvk=
X-Google-Smtp-Source: AGHT+IFy7XtqRkPSt0EKbCIU/nLe4YKPLItixeSarCE9YUMy/AXsmYTYVPsLNTnZmsEPrt+0j0pV6Gznnw6Fp1h8fxI=
X-Received: by 2002:a05:6830:1d3:b0:6bc:e6bc:5dbf with SMTP id
 r19-20020a05683001d300b006bce6bc5dbfmr19981627ota.23.1694082810648; Thu, 07
 Sep 2023 03:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org>
 <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com> <CAA8EJpqTwbEDcws=Wd1tuXkmEdRZnh_DkMydofKZ-n9srEyJWQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqTwbEDcws=Wd1tuXkmEdRZnh_DkMydofKZ-n9srEyJWQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 7 Sep 2023 06:33:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7GERhujsJ-gPegQp2_KW+7htS2+GO6b-_tV1Lf=LbAPQ@mail.gmail.com>
Message-ID: <CA+5PVA7GERhujsJ-gPegQp2_KW+7htS2+GO6b-_tV1Lf=LbAPQ@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 7:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 6 Sept 2023 at 14:19, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Tue, Sep 5, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Please pull in firmware updates for the Qualcomm Robotics RB5 platfor=
m. This
> > > includes SM8250 DSP firmware updates, video encoder/decoder (venus.mb=
n)
> > > firmware update. Also as a part of this update is included the board-=
specific
> > > firmware for the Sensors DSP.
> > >
> > > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191=
a8ddb5:
> > >
> > >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmwar=
e (2023-08-04 06:33:54 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/lumag/linux-firmware rb5-update
> > >
> > > for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53=
a8:
> > >
> > >   qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +03=
00)
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Baryshkov (3):
> > >       qcom: sm8250: update DSP firmware
> > >       qcom: Update vpu-1.0 firmware
> > >       qcom: sm8250: add RB5 sensors DSP firmware
> > >
> > >  qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
> > >  qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
> > >  qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
> > >  qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 by=
tes
> > >  qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 byte=
s
> > >  qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 byte=
s
> > >  6 files changed, 42 insertions(+)
> > >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
> > >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
> > >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn
> >
> > This misses WHENCE entries for the new files.
> >
> > [jwboyer@vader linux-firmware]$ ./check_whence.py
> > E: qcom/sm8250/Thundercomm/RB5/slpi.mbn not listed in WHENCE
> > E: qcom/sm8250/Thundercomm/RB5/slpir.jsn not listed in WHENCE
> > E: qcom/sm8250/Thundercomm/RB5/slpius.jsn not listed in WHENCE
> > [jwboyer@vader linux-firmware]$
> >
> > Can you rebase against the main branch and fix this?
>
> Done. Please give it a try:
>
> The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade9=
01:
>
>   Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +000=
0)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware rb5-update

Pulled and pushed out.

josh

>
> for you to fetch changes up to bb3d5bc99fe629cab2024c9bac528c3b466d2f31:
>
>   qcom: sm8250: add RB5 sensors DSP firmware (2023-09-06 14:35:32 +0300)
>
>
> --
> With best wishes
> Dmitry
