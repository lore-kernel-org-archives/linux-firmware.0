Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD9C83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B71FEC433C9; Mon, 28 Aug 2023 11:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10D7C433C8
	for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693221349;
	bh=AZkp1N613hCynckzPxjTIMV/mhflJ20MKxAunxnJUd8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bRKX5Uuk18NUPyeY4FrCV4Pjs7crObK6/A49U13MgMA0l340YKFD5VfAdJi6+fNKE
	 MJ+to6D6fciqot0VTmfWc/0938QAKqVGev93DEByPmof9sIqR4MOvEMAbu8dxZ2rvo
	 8QQYmIAaoUGVjlP1F5pP1WWFMWo+6ZTtBIuWNpuxYuZCbiL/1EfmNBDWmwgPrV9VaL
	 Ll/JSmLUZ9zFYbQ58fnKwXdxXFfHUh6tRIG2A0wuVlUMVqZVQjMKjGo/nm+Brkp96a
	 5xRymYYDg1tHbqHbJRkpKVP1qRkft7kobNNOCBRLueRzSC2shzgPtgQuFrcVA3rPah
	 sXERxQrhhlVdg==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d77ad095f13so2713325276.2
        for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 04:15:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxE34J3JVYrDGHVtN6GYAKrks5ku9qwWWw3PmNpkI8/A6WPBW/8
	Qh/7OcamUTywTAlZ9+Z/ZLhj9wV8D4soh7tDj74=
X-Google-Smtp-Source: AGHT+IFmiBbGZ6qoOhfC8f8d81Akth8UTPeZ+W5ke+Gp7P1y3ISSU/xSHaGz8jzx2+HVOq3huSU3uhEEBCwQD1Oe1jc=
X-Received: by 2002:a25:2495:0:b0:d67:5d71:d818 with SMTP id
 k143-20020a252495000000b00d675d71d818mr24758803ybk.1.1693221348599; Mon, 28
 Aug 2023 04:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230815180018.25554-1-mario.limonciello@amd.com> <60fcf13c-c1bb-46f4-86bc-d3c674d0bf4b@linaro.org>
In-Reply-To: <60fcf13c-c1bb-46f4-86bc-d3c674d0bf4b@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 07:15:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4DjHCn_zDoFOimr7NW5GpN8+zTVWJEAmo+c6biCHEicg@mail.gmail.com>
Message-ID: <CA+5PVA4DjHCn_zDoFOimr7NW5GpN8+zTVWJEAmo+c6biCHEicg@mail.gmail.com>
Subject: Re: [PATCH 00/20] Add preparations to be able to run in a CI/CD system
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 1:22=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Helo,
>
> On 15/08/2023 20:59, Mario Limonciello wrote:
> > If linux-firmware.git or a fork of it is hosted in Gitlab there is the
> > ability to gate pull requests based on some CI checks.
> >
> > The basic ones that come to mind are:
> > 1. Checking spelling.
>
> First, you are renaming a lot of 'licence' files to be named 'license'.
> This is fine from the US English point of view. Other (e.g. UK) English
> keep the difference between licence (noun) and license (verb). Not
> everybody uses the US English, especially for the legal documents.
>
> Second, renaming licence files and/or changing their contents doesn't
> sound right to me. They are legally binding documents, with all the
> mistakes and typos. They are usually passed through the legal
> departments, etc. I would not guarantee that one wouldn't consider
> licence being void after these spelling corrections.

I agree with Dmitry on these two points.

We should be able to figure out a way to have any future CI checks
scan MRs for typographical errors and catch them at that point, but
doing a blanket rename and cleanup is something we should probably
avoid for now.

josh

>
> > 2. Checking WHENCE.
> > 3. Checking for SoB.
> > 4. Ensure that any python scripts pass style for 'black'.
> >
> > All of the checks can be triggered by `pre-commit` or by `make check`
> >
> > This series cleans up linux-firmware.git so all those would pass and
> > adds some templates to that effect.
> >
> > Mario Limonciello (20):
> >    ath11k: update typographical errors in the Notice.txt files
> >    ath10k: correct typographical errors in the Notice.txt files
> >    i915: correct typographical errors caught by codespell
> >    adsp_sst: correct typographical errors caught by codespell
> >    agere: correct typographical errors in LICENSE caught by codespell
> >    qca: correct typographical errors in NOTICE.txt caught by codespell
> >    usbdux: correct typographical errors caught by codespell
> >    dsp56k: correct typographical error caught by codespell
> >    cxgb4: correct typographical errors caught by codespell
> >    cavium_liquidio: fix typographical errors caught by codespell
> >    kaweth: correct typographical errors caught by codespell
> >    xc5000c: correct typographical errors caught by codespell
> >    qcom: correct typographical errors caught by codespell
> >    keyspan_pda: correct typographical errors caught by codespell
> >    carl9170fw: correct typographical errors caught by codespell
> >    WHENCE: correct typographical errors caught by codespell
> >    check_whence: reformat using python black
> >    Add CI/CD with ci-fairy
> >    Wire up pre-commit to `make check`
> >    Rewrite README in markdown
> >
> >   .codespell.cfg                                |   4 +
> >   .gitignore                                    |   1 +
> >   .gitlab-ci.yml                                |  22 +
> >   .pre-commit-config.yaml                       |  33 ++
> >   LICENCE.Abilis =3D> LICENSE.Abilis              |   0
> >   LICENCE.IntcSST2 =3D> LICENSE.IntcSST2          |   0
> >   LICENCE.Marvell =3D> LICENSE.Marvell            |   0
> >   LICENCE.NXP =3D> LICENSE.NXP                    |   0
> >   LICENCE.Netronome =3D> LICENSE.Netronome        |   0
> >   LICENCE.OLPC =3D> LICENSE.OLPC                  |   0
> >   LICENCE.adsp_sst =3D> LICENSE.adsp_sst          |   4 +-
> >   LICENCE.agere =3D> LICENSE.agere                |   2 +-
> >   ...heros_firmware =3D> LICENSE.atheros_firmware |   0
> >   ...oadcom_bcm43xx =3D> LICENSE.broadcom_bcm43xx |   0
> >   LICENCE.ca0132 =3D> LICENSE.ca0132              |   0
> >   LICENCE.cadence =3D> LICENSE.cadence            |   0
> >   LICENCE.cavium =3D> LICENSE.cavium              |   0
> >   ...cavium_liquidio =3D> LICENSE.cavium_liquidio |   4 +-
> >   ...elsio_firmware =3D> LICENSE.chelsio_firmware |   0
> >   LICENCE.cnm =3D> LICENSE.cnm                    |   0
> >   LICENCE.cw1200 =3D> LICENSE.cw1200              |   0
> >   LICENCE.cypress =3D> LICENSE.cypress            |   0
> >   LICENCE.e100 =3D> LICENSE.e100                  |   0
> >   LICENCE.ene_firmware =3D> LICENSE.ene_firmware  |   0
> >   LICENCE.fw_sst_0f28 =3D> LICENSE.fw_sst_0f28    |   0
> >   LICENCE.go7007 =3D> LICENSE.go7007              |   0
> >   LICENSE.i915                                  |  78 ++--
> >   LICENCE.ibt_firmware =3D> LICENSE.ibt_firmware  |   0
> >   LICENCE.it913x =3D> LICENSE.it913x              |   0
> >   ...lwifi_firmware =3D> LICENSE.iwlwifi_firmware |   0
> >   LICENCE.kaweth =3D> LICENSE.kaweth              |   2 +-
> >   LICENCE.linaro =3D> LICENSE.linaro              |   0
> >   LICENCE.mediatek =3D> LICENSE.mediatek          |   0
> >   LICENCE.microchip =3D> LICENSE.microchip        |   0
> >   LICENCE.moxa =3D> LICENSE.moxa                  |   0
> >   ...10ge_firmware =3D> LICENSE.myri10ge_firmware |   0
> >   LICENCE.nvidia =3D> LICENSE.nvidia              |   0
> >   ...irmware =3D> LICENSE.open-ath9k-htc-firmware |   0
> >   LICENCE.phanfw =3D> LICENSE.phanfw              |   0
> >   LICENCE.qat_firmware =3D> LICENSE.qat_firmware  |   0
> >   LICENCE.qla1280 =3D> LICENSE.qla1280            |   0
> >   LICENCE.qla2xxx =3D> LICENSE.qla2xxx            |   0
> >   LICENCE.r8a779x_usb3 =3D> LICENSE.r8a779x_usb3  |   0
> >   ...irmware.txt =3D> LICENSE.ralink-firmware.txt |   0
> >   ...LICENSE.ralink_a_mediatek_company_firmware |   0
> >   LICENCE.rockchip =3D> LICENSE.rockchip          |   0
> >   ...rmware.txt =3D> LICENSE.rtlwifi_firmware.txt |   0
> >   LICENCE.siano =3D> LICENSE.siano                |   0
> >   ...ti-connectivity =3D> LICENSE.ti-connectivity |   0
> >   LICENCE.ti-keystone =3D> LICENSE.ti-keystone    |   0
> >   LICENCE.ti-tspa =3D> LICENSE.ti-tspa            |   0
> >   ...4-firmware =3D> LICENSE.ueagle-atm4-firmware |   0
> >   LICENCE.via_vt6656 =3D> LICENSE.via_vt6656      |   0
> >   LICENCE.wl1251 =3D> LICENSE.wl1251              |   0
> >   LICENCE.xc4000 =3D> LICENSE.xc4000              |   0
> >   LICENCE.xc5000 =3D> LICENSE.xc5000              |   0
> >   LICENCE.xc5000c =3D> LICENSE.xc5000c            |   2 +-
> >   Makefile                                      |   6 +-
> >   README                                        |  43 --
> >   README.md                                     |  54 +++
> >   WHENCE                                        | 432 +++++++++--------=
-
> >   .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
> >   .../hw2.1/notice_ath10k_firmware-5.txt        | 138 +++---
> >   .../hw3.0/notice_ath10k_firmware-4.txt        | 144 +++---
> >   .../hw3.0/notice_ath10k_firmware-6.txt        |  32 +-
> >   .../hw3.0/notice_ath10k_firmware-sdio-6.txt   |  32 +-
> >   .../hw1.0/notice_ath10k_firmware-5.txt        | 138 +++---
> >   .../hw1.0/notice_ath10k_firmware-6.txt        |  32 +-
> >   .../hw1.0/notice_ath10k_firmware-sdio-5.txt   | 138 +++---
> >   .../hw1.0/notice_ath10k_firmware-5.txt        |   8 +-
> >   .../hw2.0/notice_ath10k_firmware-5.txt        |  40 +-
> >   .../hw2.0/notice_ath10k_firmware-4.txt        |   8 +-
> >   .../hw2.0/notice_ath10k_firmware-5.txt        |   8 +-
> >   .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
> >   .../hw2.0/notice_ath10k_firmware-5.txt        |  26 +-
> >   ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp      |  26 +-
> >   ath11k/IPQ5018/hw1.0/Notice.txt               |  28 +-
> >   ath11k/IPQ6018/hw1.0/Notice.txt               |  28 +-
> >   ath11k/IPQ8074/hw2.0/Notice.txt               |  28 +-
> >   ath11k/QCA6390/hw2.0/Notice.txt               | 100 ++--
> >   ath11k/QCN9074/hw1.0/Notice.txt               |  28 +-
> >   ath11k/WCN6750/hw1.0/Notice.txt               | 164 +++----
> >   ath11k/WCN6855/hw2.0/Notice.txt               |  26 +-
> >   carl9170fw/carlfw/Kconfig                     |   2 +-
> >   carl9170fw/carlfw/carl9170.lds                |   4 +-
> >   carl9170fw/carlfw/include/dma.h               |   2 +-
> >   carl9170fw/carlfw/src/wlan.c                  |   4 +-
> >   carl9170fw/carlfw/src/wol.c                   |   2 +-
> >   carl9170fw/extra/FindGPERF.cmake              |   2 +-
> >   .../extra/FindPackageHandleStandardArgs.cmake |   8 +-
> >   carl9170fw/include/shared/fwcmd.h             |   2 +-
> >   carl9170fw/include/shared/phy.h               |   2 +-
> >   carl9170fw/tools/carlu/src/fw.c               |   2 +-
> >   carl9170fw/tools/carlu/src/test.c             |   4 +-
> >   carl9170fw/tools/carlu/src/usb.c              |   6 +-
> >   carl9170fw/tools/include/frame.h              |  12 +-
> >   check_whence.py                               |  89 ++--
> >   cxgb4/configs/t4-config-default.txt           |   6 +-
> >   cxgb4/configs/t5-config-default.txt           |   6 +-
> >   cxgb4/configs/t5-config-hashfilter.txt        |   6 +-
> >   cxgb4/configs/t6-config-default.txt           |   6 +-
> >   cxgb4/configs/t6-config-hashfilter.txt        |   8 +-
> >   dsp56k/concat-bootstrap.pl                    |   2 +-
> >   keyspan_pda/keyspan_pda.S                     |   4 +-
> >   keyspan_pda/xircom_pgs.S                      |   4 +-
> >   qca/NOTICE.txt                                |   6 +-
> >   qcom/NOTICE.txt                               |  16 +-
> >   usbdux/usbdux_firmware.asm                    |  16 +-
> >   usbdux/usbduxfast_firmware.asm                |   6 +-
> >   usbdux/usbduxsigma_firmware.asm               |  14 +-
> >   wfx/{LICENCE.wf200 =3D> LICENSE.wf200}          |   0
> >   111 files changed, 1137 insertions(+), 1043 deletions(-)
> >   create mode 100644 .codespell.cfg
> >   create mode 100644 .gitignore
> >   create mode 100644 .gitlab-ci.yml
> >   create mode 100644 .pre-commit-config.yaml
> >   rename LICENCE.Abilis =3D> LICENSE.Abilis (100%)
> >   rename LICENCE.IntcSST2 =3D> LICENSE.IntcSST2 (100%)
> >   rename LICENCE.Marvell =3D> LICENSE.Marvell (100%)
> >   rename LICENCE.NXP =3D> LICENSE.NXP (100%)
> >   rename LICENCE.Netronome =3D> LICENSE.Netronome (100%)
> >   rename LICENCE.OLPC =3D> LICENSE.OLPC (100%)
> >   rename LICENCE.adsp_sst =3D> LICENSE.adsp_sst (99%)
> >   rename LICENCE.agere =3D> LICENSE.agere (98%)
> >   rename LICENCE.atheros_firmware =3D> LICENSE.atheros_firmware (100%)
> >   rename LICENCE.broadcom_bcm43xx =3D> LICENSE.broadcom_bcm43xx (100%)
> >   rename LICENCE.ca0132 =3D> LICENSE.ca0132 (100%)
> >   rename LICENCE.cadence =3D> LICENSE.cadence (100%)
> >   rename LICENCE.cavium =3D> LICENSE.cavium (100%)
> >   rename LICENCE.cavium_liquidio =3D> LICENSE.cavium_liquidio (97%)
> >   rename LICENCE.chelsio_firmware =3D> LICENSE.chelsio_firmware (100%)
> >   rename LICENCE.cnm =3D> LICENSE.cnm (100%)
> >   rename LICENCE.cw1200 =3D> LICENSE.cw1200 (100%)
> >   rename LICENCE.cypress =3D> LICENSE.cypress (100%)
> >   rename LICENCE.e100 =3D> LICENSE.e100 (100%)
> >   rename LICENCE.ene_firmware =3D> LICENSE.ene_firmware (100%)
> >   rename LICENCE.fw_sst_0f28 =3D> LICENSE.fw_sst_0f28 (100%)
> >   rename LICENCE.go7007 =3D> LICENSE.go7007 (100%)
> >   rename LICENCE.ibt_firmware =3D> LICENSE.ibt_firmware (100%)
> >   rename LICENCE.it913x =3D> LICENSE.it913x (100%)
> >   rename LICENCE.iwlwifi_firmware =3D> LICENSE.iwlwifi_firmware (100%)
> >   rename LICENCE.kaweth =3D> LICENSE.kaweth (97%)
> >   rename LICENCE.linaro =3D> LICENSE.linaro (100%)
> >   rename LICENCE.mediatek =3D> LICENSE.mediatek (100%)
> >   rename LICENCE.microchip =3D> LICENSE.microchip (100%)
> >   rename LICENCE.moxa =3D> LICENSE.moxa (100%)
> >   rename LICENCE.myri10ge_firmware =3D> LICENSE.myri10ge_firmware (100%=
)
> >   rename LICENCE.nvidia =3D> LICENSE.nvidia (100%)
> >   rename LICENCE.open-ath9k-htc-firmware =3D> LICENSE.open-ath9k-htc-fi=
rmware (100%)
> >   rename LICENCE.phanfw =3D> LICENSE.phanfw (100%)
> >   rename LICENCE.qat_firmware =3D> LICENSE.qat_firmware (100%)
> >   rename LICENCE.qla1280 =3D> LICENSE.qla1280 (100%)
> >   rename LICENCE.qla2xxx =3D> LICENSE.qla2xxx (100%)
> >   rename LICENCE.r8a779x_usb3 =3D> LICENSE.r8a779x_usb3 (100%)
> >   rename LICENCE.ralink-firmware.txt =3D> LICENSE.ralink-firmware.txt (=
100%)
> >   rename LICENCE.ralink_a_mediatek_company_firmware =3D> LICENSE.ralink=
_a_mediatek_company_firmware (100%)
> >   rename LICENCE.rockchip =3D> LICENSE.rockchip (100%)
> >   rename LICENCE.rtlwifi_firmware.txt =3D> LICENSE.rtlwifi_firmware.txt=
 (100%)
> >   rename LICENCE.siano =3D> LICENSE.siano (100%)
> >   rename LICENCE.ti-connectivity =3D> LICENSE.ti-connectivity (100%)
> >   rename LICENCE.ti-keystone =3D> LICENSE.ti-keystone (100%)
> >   rename LICENCE.ti-tspa =3D> LICENSE.ti-tspa (100%)
> >   rename LICENCE.ueagle-atm4-firmware =3D> LICENSE.ueagle-atm4-firmware=
 (100%)
> >   rename LICENCE.via_vt6656 =3D> LICENSE.via_vt6656 (100%)
> >   rename LICENCE.wl1251 =3D> LICENSE.wl1251 (100%)
> >   rename LICENCE.xc4000 =3D> LICENSE.xc4000 (100%)
> >   rename LICENCE.xc5000 =3D> LICENSE.xc5000 (100%)
> >   rename LICENCE.xc5000c =3D> LICENSE.xc5000c (93%)
> >   delete mode 100644 README
> >   create mode 100644 README.md
> >   rename wfx/{LICENCE.wf200 =3D> LICENSE.wf200} (100%)
> >
>
> --
> With best wishes
> Dmitry
>
