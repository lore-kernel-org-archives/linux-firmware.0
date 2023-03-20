Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A006EC6FD1D
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Mar 2023 11:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 704A9C433A0; Mon, 20 Mar 2023 11:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55760C4339B;
	Mon, 20 Mar 2023 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679312612;
	bh=2sdVoNcbN5XWmxDPO3dyQz+o+5RBbCMPdZigdt46KcU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HA+q/EhGyoUl/+UxIjLyf8w5j6uR/51f0vUFRCNgwvGR0XWsJR/CQD5lpGTTxcTKU
	 7BJKrcBOGTzQXCAOFPyFfuHc+OEme0Fhb3tTbBh2vKoE/nIRag5O8bjZDjSi5NrTKK
	 49qOZckVL4wyhaxhapkY8tFNg48DKEhEyo7TC3v69cDqgvEyWuKHqVUYydyMpk8OEH
	 c/Ka/Btnkxl2rRf3uRrleYCweJyMINe+DkyUvCSHxpvDjSthlnWzN/O8JkUYyQpx4y
	 znmffcQjJ4kOeZafLX/58SH0eFiVCQCp+Jtp3aYkU6rgCWPxO6ZJIQd3u/1dUSlzMO
	 uYTRxFkPLnysg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5445009c26bso218645697b3.8;
        Mon, 20 Mar 2023 04:43:32 -0700 (PDT)
X-Gm-Message-State: AO0yUKWV2medTDqzzQDficDbLeSRYM7UWBhTXQSLhPlMtm1q6t/CzkN8
	uYsv+xLdzwX2rO0BSj7rAjjxNeAxhw9Wx4p2ji8=
X-Google-Smtp-Source: AK7set9JTN3ug2u+wsGL3RvfeDOdXCbn6yLK+kUfP1psKwrN4iQ5OLg0e/e0Huf35JLMk8UJShNpgeI09A1meRtUmi4=
X-Received: by 2002:a81:a704:0:b0:544:bbd2:749c with SMTP id
 e4-20020a81a704000000b00544bbd2749cmr6930255ywh.2.1679312611314; Mon, 20 Mar
 2023 04:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <889f3db6ca4008047595f4392388acc1f165e03c.camel@realtek.com>
In-Reply-To: <889f3db6ca4008047595f4392388acc1f165e03c.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Mar 2023 07:43:20 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4H9Quu1954ubbcZfH-e1cOy2K27r0GfLemQcMBG-6AQA@mail.gmail.com>
Message-ID: <CA+5PVA4H9Quu1954ubbcZfH-e1cOy2K27r0GfLemQcMBG-6AQA@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852b: rollback firmware to v0.27.32.1 and
 introduce new file to new format
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"rb0171610@gmail.com" <rb0171610@gmail.com>, 
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>, "tiwai@suse.de" <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 9:59=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> In discussion threads [1] [2], the new format of 8852b break user space.
> To avoid this, introduce new filename rtw89/rtw8852b_fw-1.bin that old
> drivers will not try to load it.
>
> Rollback firmware version of rtw89/rtw8852b_fw.bin to the latest
> version of original format (i.e. v0.27.32.1) supported by old driver.
>
> The patches to support new filename in new driver are almost done,
> and I will submit them soon. Thanks for the advice in mail and
> bug threads.
>
>
> [1]
> https://lore.kernel.org/linux-wireless/df1ce994-3368-a57e-7078-8bdcccf4a1=
fd@gmail.com/T/#m24cb43be31a762d0ea70bf07f27ae96c59f6931b
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217207
>
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit c761dbe804f903cc2df81f251d367cca285eca=
06:
>
>   Merge tag 'iwlwifi-fw-2023-03-13' of
> http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (20=
23-03-13 09:20:47 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to 2c07f017ff42398e25b8552bc8e01c7c667b8592:
>
>   rtw89: 8852b: update format-1 fw to v0.29.29.0 (2023-03-18 21:44:30 +08=
00)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (3):
>       rtw89: 8852b: rollback firmware to v0.27.32.1
>       rtw89: 8852b: add format-1 fw v0.29.26.0
>       rtw89: 8852b: update format-1 fw to v0.29.29.0
>
>  WHENCE                  |   1 +
>  rtw89/rtw8852b_fw-1.bin | Bin 0 -> 1188488 bytes
>  rtw89/rtw8852b_fw.bin   | Bin 1188488 -> 1035232 bytes
>  3 files changed, 1 insertion(+)
>  create mode 100644 rtw89/rtw8852b_fw-1.bin
>
