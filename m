Return-Path: <SRS0=NG2H=KI=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B68C433ED
	for <linux-firmware@archiver.kernel.org>; Thu, 13 May 2021 21:09:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BA44761438; Thu, 13 May 2021 21:09:07 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F35961406
	for <linux-firmware@kernel.org>; Thu, 13 May 2021 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F35961406
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=briannorris@chromium.org
Received: by mail-ot1-f41.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so14588217otg.2
        for <linux-firmware@kernel.org>; Thu, 13 May 2021 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZuUVc+1Gl3iIMPO5R1BBEz+t2k66T/LegE8x91I0Gyo=;
        b=MjtIaP2wvTeRYdgQ1Gs8+IDchcxKLvy7E6G2XGtqFfPq97cOecV+h0JvW/VNoPKvjw
         J2xRB+J/L+PELAEN2xaczYu2tlDe/FKQONEWN77Ret1EN+1awO39Fp7HeiU0ZcnTDKTA
         tg9KM4QX9NNno94xte6GDONQSpnUhSAgIyh4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZuUVc+1Gl3iIMPO5R1BBEz+t2k66T/LegE8x91I0Gyo=;
        b=N3ClicxSYnjJsSy8HnBMS8Qle9OSyY1Ff/ByVkyx1duXbRFRCR+Pqv4GDjm/PNNgEi
         GWO2snRhFlEdYnhUPFE5UHJ2b1sT3u0pmfB+Mwlz0Ik0Ed8grwuZS48m+9YX+mRZo2Pq
         n7G0sXElhrU1QowyVqPwuivuQhIu+0DUppDBf/u2S26oCVR4yAVtKEEz2ZHRCjJiq9a/
         KOfn1FnlChaV8yEmp6ExOTeUjCBQG1Y87NSZ/pPXdDmlVKEO36K4gLlQzxeoCo9Z4qJl
         M/PWyyjip/nom0hfx68BtNKdOPKPDoMW08iGfrco6aj1GGMwN8fz8x5PjbUUAujqC/fL
         65TA==
X-Gm-Message-State: AOAM531v4tqmmzV1ZCE8VSP0bL4ATsWaTwhVkZ8gYThI5O0I70EM5g9e
	BFOodQdpyaf9B34vvvWyduwXiJ0vJvQvtw==
X-Google-Smtp-Source: ABdhPJwhMJJXOe9Cd+1kmsO9cKRb98sHrwSimp9jEdr4cCHTz2AEOSdXbtNUoEZf5nb6dFfOM5mISg==
X-Received: by 2002:a9d:2f66:: with SMTP id h93mr32055052otb.188.1620940146315;
        Thu, 13 May 2021 14:09:06 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id z15sm907427otp.20.2021.05.13.14.09.04
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 14:09:04 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso24001294ots.10
        for <linux-firmware@kernel.org>; Thu, 13 May 2021 14:09:04 -0700 (PDT)
X-Received: by 2002:a9d:f66:: with SMTP id 93mr36813659ott.229.1620940143875;
 Thu, 13 May 2021 14:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <57e9f582340545c79a9ab3433e2a4a7d@realtek.com> <87cztx87tr.fsf@tynnyri.adurom.net>
 <CA+ASDXM9YmhMWmttkrCxB0_tf6Kf6Sz=7Yc26CmjZmMUxyxAfw@mail.gmail.com>
 <87tun7i2rn.fsf@codeaurora.org> <876c29841fcf4d21ab2440cbb5879de2@realtek.com>
In-Reply-To: <876c29841fcf4d21ab2440cbb5879de2@realtek.com>
From: Brian Norris <briannorris@chromium.org>
Date: Thu, 13 May 2021 14:08:53 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMN__j0x5hN5t98C4k+upOcs+T1=MrivCbxRYa_-ENt_A@mail.gmail.com>
Message-ID: <CA+ASDXMN__j0x5hN5t98C4k+upOcs+T1=MrivCbxRYa_-ENt_A@mail.gmail.com>
Subject: Re: Request to update 8852a firmware of rtw89 to v0.13.8.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 2:38 AM Pkshih <pkshih@realtek.com> wrote:
> > -----Original Message-----
> > From: kvalo=codeaurora.org@mg.codeaurora.org [mailto:kvalo=codeaurora.org@mg.codeaurora.org] On
> > Behalf Of Kalle Valo

> > It can create confusion to the users if during review we make changes
> > how firmware files are handled. Some drivers have windows style .ini
> > files which are not ok in an upstream driver, there could be changes in
> > the file format etc.

Sure, good point. I figured if there's no driver merged anywhere
upstream, people (e.g., me) are taking their own life in their hands
trying to utilize arbitrary versions from the mailing list. But I
could see why you still don't want the potential mismatch.

> > But I have no strong opinion here, my main motivation is just to try to
> > keep things simple for maintaining the "interface" between
> > linux-firmware and kernel wireless drivers. My preference is that the
> > firmware files are ready for submission when a new driver is submitted
> > for review, but the firmware files are submitted only after the driver
> > is accepted.

Ack, that's definitely important to me. The first versions had no
publicly posted firmware, and at least one person (not me at the time)
asked for it. My extension of that is that I don't want to
_discourage_ vendors posting their firmware to public repos :)

> I think I can maintain the firmware in GitHub before driver is accepted,
> and add some information about firmware version and link in the cover of
> patchset. Then, people can take proper firmware.

Sure, that can work.

Thanks,
Brian
