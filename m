Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C5DC678D4
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E16D5C4339B; Tue,  7 Mar 2023 15:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF25C4339E
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678201311;
	bh=an+T2hD4BC68zElHimK1P0wiPADXWas5p1ky+MB+fXo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KqCuG6b4k92A7SrMay7OCX7uzWSOpkha83QDD9Q829s0P2qhRJKrRRhHuR+dmQLOr
	 ctIlfu+GF28MXbbgTk94Vs0O/EmcTJpfzX6l0ADfkTMA+xnAVKfUsM/mCBM0xiwdao
	 oZ3AuoRinDRz0fv5+zAYU2HiJo3n6/RFwGj3YHg7gXHrKPEkMTrndfuni5LVHRgEwu
	 9EVgXU/IKHWIIhcAbQqYZmBR+SjVPYjLuqIvmF6UF/lMnk1QJhWCkk4mi5BpFs4Z8x
	 gYfcbShDmPDuHHbb8eKfilUzjwhUJe8ZJ9q1rQQ9j+0V7SshMQnzNFsm2LjlRAo+u2
	 0l+aGGrLvcPlA==
Received: by mail-qk1-f170.google.com with SMTP id d75so4553116qkg.0
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 07:01:51 -0800 (PST)
X-Gm-Message-State: AO0yUKVwOXD5tuzznP9nB6CSzUm+vMsh9RvmbNn7If6DsQXvjXpEI2pr
	ayUfIaCvwbu24ncqW9yI5yXXleFpCoSDxsrh7/A=
X-Google-Smtp-Source: AK7set/e7CQTHlh7OERK7Q4AuAQkldc4mnSWFORurCnDE8hpQqzjs3XPlblZeTCgGWki9EvGB/E8Q/u0FNqCvQGUVaw=
X-Received: by 2002:a37:e209:0:b0:71f:b8ba:ff4a with SMTP id
 g9-20020a37e209000000b0071fb8baff4amr4175228qki.8.1678201310746; Tue, 07 Mar
 2023 07:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-4-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-4-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 10:01:27 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4VjL9TWLOffAAdCNb2V=y-gET-ZY9axdO2QQBw8rs3sQ@mail.gmail.com>
Message-ID: <CA+5PVA4VjL9TWLOffAAdCNb2V=y-gET-ZY9axdO2QQBw8rs3sQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/16] WHENCE: remove duplicate File entries
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Applied and pushed out.

josh

> ---
>  WHENCE | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 214952e..7de6d6b 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1073,10 +1073,6 @@ Version: 75.27f1c37b.0
>  File: iwlwifi-so-a0-jf-b0-77.ucode
>  Version: 74.f92b5fed.0
>
> -File: iwlwifi-so-a0-gf-a0.pnvm
> -
> -File: iwlwifi-so-a0-gf4-a0.pnvm
> -
>  File: iwlwifi-ty-a0-gf-a0.pnvm
>
>  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
> @@ -2980,19 +2976,6 @@ Licence: Redistributable. See LICENCE.rtlwifi_firm=
ware.txt for details.
>
>  ------------------------------------------------------------------------=
--
>
> -Driver: r8723au - Realtek 802.11n WLAN driver for RTL8723AU
> -
> -Info: Taken from Realtek driver rtl8723A_WiFi_linux_v4.1.3_6044.20121224
> -      Firmware is embedded in the driver as data statements. This info
> -      has been extracted into a binary file.
> -File: rtlwifi/rtl8723aufw_A.bin
> -File: rtlwifi/rtl8723aufw_B.bin
> -File: rtlwifi/rtl8723aufw_B_NoBT.bin
> -
> -Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
> -
> -------------------------------------------------------------------------=
--
> -
>  Driver: rtl8188ee - Realtek 802.11n WLAN driver for RTL8188EE
>
>  Info: Taken from Realtek version rtl_92ce_92se_92de_8723ae_88ee_linux_ma=
c80211_0010.0109.2013
> @@ -5942,8 +5925,6 @@ Link: cirrus/cs35l41-dsp1-spk-prot-103c8995.wmfw ->=
 cs35l41/v6.61.1/halo_cspl_RA
>  Link: cirrus/cs35l41-dsp1-spk-cali-103c8995.wmfw -> cs35l41/v6.61.1/halo=
_cspl_RAM_revB2_29.63.1.wmfw
>  Link: cirrus/cs35l41-dsp1-spk-prot-103c89c6.wmfw -> cs35l41/v6.61.1/halo=
_cspl_RAM_revB2_29.63.1.wmfw
>  Link: cirrus/cs35l41-dsp1-spk-cali-103c89c6.wmfw -> cs35l41/v6.61.1/halo=
_cspl_RAM_revB2_29.63.1.wmfw
> -File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
> -File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
>  File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
>  File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
>  File: cirrus/cs35l41-dsp1-spk-prot-103c8972.bin
>
> --
> 2.39.2
>
