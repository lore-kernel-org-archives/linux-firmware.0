Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C2EC433DB
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Dec 2020 13:35:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 351AB2222A; Wed, 30 Dec 2020 13:35:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 132882220B
	for <linux-firmware@kernel.org>; Wed, 30 Dec 2020 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609335343;
	bh=tPCZ/2uO7bWqcGAxl5A3giE4FytOqf3i6iSz4bnwJ3s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YEuKmn0rZnQFyJtb/vQxRdF4dHfdM5HnHHVumo3XDkQ5obTWFPZS3SZ6TEJoTM4w/
	 yLc9Y0wg2YDcI2Y8ekZKQGBVze2ViukHQART3qf7U6pt/Bk5UH/cYao4b0c+afh19k
	 x8PD3Yvs/2iqMHXMEdhcqIypXAKOJuVzVO1GnPRc7nCLKF4ChnZaOZgXL4ro3kpLPa
	 7RtIPoZjydrUNIfwn+UzAf38Z6wLFhtqmurAuwpNoukl20rmWOLFS5MQg3el9Tk6ze
	 6akrpATIxzZ37BsjLrlLdKEmvJ4PB+GPO3CBj+YNzlKj8do4mnS8UH7xQjmW+cM0Pj
	 BHJ4Um2L4vvkA==
Received: by mail-il1-f179.google.com with SMTP id w17so14805458ilj.8
        for <linux-firmware@kernel.org>; Wed, 30 Dec 2020 05:35:43 -0800 (PST)
X-Gm-Message-State: AOAM532mjNtzA8ztsOJWiaTBLPAsSj2ox+xlRBAPHea9GzmV9yF1dxcW
	AcwdKIU3FTDKwLvsXgRzWWaHiPeIanrGDvPRsGc=
X-Google-Smtp-Source: ABdhPJx57ar5LmkaLPP13/NZJ3L+32hoo0Tc81m7qxpGjw42k9hfjTfrmC2/BrjpnuNgAy4L/AzLPCz1NsWy9V9bMuM=
X-Received: by 2002:a92:58dc:: with SMTP id z89mr51675235ilf.11.1609335342543;
 Wed, 30 Dec 2020 05:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20201116055438.6048-1-hildawu@realtek.com> <e9a95a6d-37d8-8d2c-b0f4-2cd22927d00d@lwfinger.net>
 <7f6f8aabaf744d94b5facbfd4ddebca3@realtek.com>
In-Reply-To: <7f6f8aabaf744d94b5facbfd4ddebca3@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 30 Dec 2020 08:35:31 -0500
X-Gmail-Original-Message-ID: <CA+5PVA54kR1WgAn79MWuQGbaROnmNdF=5j4Tcs1g=cjwSa2uvg@mail.gmail.com>
Message-ID: <CA+5PVA54kR1WgAn79MWuQGbaROnmNdF=5j4Tcs1g=cjwSa2uvg@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, Max Chou <max.chou@realtek.com>, 
	"alex_lu@realsil.com.cn" <alex_lu@realsil.com.cn>, Hsin Yu Chang <hsinyu_chang@realtek.com>, 
	KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

I've applied the patch and pushed it out.

josh

On Wed, Dec 23, 2020 at 12:57 AM Hilda Wu <hildawu@realtek.com> wrote:
>
> Hi Larry & Maintainers,
>
> About this commit, do you have any further comments/suggestions on this?
> If you have any questions or concerns, please kindly let me know.
> Thank you for your assistance.
>
> Regards,
> Hilda
>
> -----Original Message-----
> From: Hilda Wu
> Sent: Tuesday, November 17, 2020 3:47 PM
> To: 'Larry Finger' <Larry.Finger@lwfinger.net>; linux-firmware@kernel.org
> Cc: jwboyer@kernel.org; Max Chou <max.chou@realtek.com>; alex_lu <alex_lu@realsil.com.cn>; Hsin Yu Chang <hsinyu_chang@realtek.com>; KidmanLee <kidman@realtek.com>
> Subject: RE: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
>
> Hi Larry,
>
> The WHENCE was included the rtl_bt/rtl8822cs_fw.bin.
> For detail, please check with this link:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=fce60a9a81bf148b5c831a3e33fe666c9b38ff23
>
> Thank you for your reminder.
>
> Regards,
> Hilda
>
> -----Original Message-----
> From: Larry Finger <larry.finger@gmail.com> On Behalf Of Larry Finger
> Sent: Tuesday, November 17, 2020 1:35 AM
> To: Hilda Wu <hildawu@realtek.com>; linux-firmware@kernel.org
> Cc: jwboyer@kernel.org; Max Chou <max.chou@realtek.com>; alex_lu <alex_lu@realsil.com.cn>; Hsin Yu Chang <hsinyu_chang@realtek.com>; KidmanLee <kidman@realtek.com>
> Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
>
> On 11/15/20 11:54 PM, hildawu@realtek.com wrote:
> > From: Hilda Wu <hildawu@realtek.com>
> >
> > This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)
> >
> > Release Version:0x059A_25CB
> >
> > Signed-off-by: Hilda Wu <hildawu@realtek.com>
> > ---
> >   rtl_bt/rtl8822cs_fw.bin | Bin 58640 -> 60956 bytes
> >   1 file changed, 0 insertions(+), 0 deletions(-)
>
> You need to add this change to WHENCE. NACK
>
> Larry
>
> ------Please consider the environment before printing this e-mail.
