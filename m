Return-Path: <SRS0=2557=TK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E15CE77187
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 14:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15BDAC4CEDD; Tue, 17 Dec 2024 14:25:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 137B9C4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 14:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 137B9C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso5296736e87.1
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734445502; x=1735050302; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuOCuL33TNZmugDw7CIjqtR0bpJl3GJtVIzXcz7+mRQ=;
        b=RAKDePZpOQTctHSaEnVg15wbLodOeaomci61QREVarRdcivcDOl0woBGtwz1FYi0Vf
         E4yjOinq9IHFUaJDXKGrM8jqbZXSGoJX2GfLd1d6EGsKo8tNm/j/YF7emExpLMCAYTCw
         tXmUou8sybIsXOJtlxCp/nAIXnG0u51uD1/RkJp6UvruGFJ4cOp7zICwRAmHsslvbYTF
         Mu8KbFnPUn4BMKODUQGczDzsMEjolkA0ieLvRzOwI8jr/TODynQKN26XECVcON+ujLqW
         NV9bui1sq65gptJ5a88UXqE/Dyrv2FFDq5OdWH8jkiImbMfWBEbg8ujYoAJ00Y9n+TMn
         w3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445502; x=1735050302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuOCuL33TNZmugDw7CIjqtR0bpJl3GJtVIzXcz7+mRQ=;
        b=dO/XuHWihCU723kHYmFWCYzyvd0TSfLJyJ9g8nJVvDT/fDGzEOd1pcGRQN0JdPMDpx
         x1a8Y+sQrDzEAJ1nx8Yp9sXuBaxv6Hy8KPCQ/scq6nYIwo08lNikDdj3DsyNAFQUexoF
         BHJURvnCNQlFWQZaUVnAGHcnImr/vqgRr9Gzmzk6ot/fj063iPtzuG6lMuf+Gvbfx0k7
         rnq/7uKYAPvI3HMnwIzZHWwfKKywcsXnv1Mykr93/jN4A11e8P1n5euEBK6OK2da6ZJ0
         R0QMDIlaqlM/exsaK44ghH1x6ToySRu5XqqV8pAYNkL3izaVGuq0Ab2u/GPP31jW77pB
         hO5Q==
X-Gm-Message-State: AOJu0Yw4WzAv1rfm3GQcj1dclTzj4uG74AbQzu5kdIf7fKLIswBZ59ZY
	D44eXU8LG0luat02+GhuojDdgkNhNb6PnAwhc6KH6uY5vC8UJ+XXgj8Oe3ixY20=
X-Gm-Gg: ASbGnctMjqqgimOWaFgGFpjcIYod7xW4xj3CAmjmmdcr/jg1VTOfGAbLc6Ltw3Ob2Dv
	PNEMe2W5XvaXtx7vSgRuoWA4DIIKZ6eslbOKptrPcO3yU05qdlQhm7f1smbIFEhwVXrJXAI8WrM
	ArXai81k3mghb1qMR00BAMoosRlMJauyaO2XoTYYSs/7leRWBnQa+BowzMYAQTlbd9qV73Njc+3
	pYnWirEtV7nKjC12aH+o2xiPT/l/xWwG0Uof50xAX9dDowO20NnJgKvPQsqoceM+s0fiPvTuAJk
	yfbsv6vBD6VcRu1ee+WllnxMvrOcEaghPoMh
X-Google-Smtp-Source: AGHT+IGGo6orJwHBnTG6SZbVYUjhcHJBSxyTZKdTG+0vYX5LwukoYi1tuc6yWkQHval+/+ToXF9CjQ==
X-Received: by 2002:a05:6512:2396:b0:540:1a0c:9ba6 with SMTP id 2adb3069b0e04-5409056ae26mr5013330e87.34.1734445502058;
        Tue, 17 Dec 2024 06:25:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120bffd1csm1159269e87.144.2024.12.17.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:25:01 -0800 (PST)
Date: Tue, 17 Dec 2024 16:24:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: update firmware binary for sc7180 and qcs615
Message-ID: <nk7v54t7smhu2xpvm5wo6nuo5onbw7texkqwbjrmftgcsxxusv@pifm7tht5h4x>
References: <6e0ae91f-7233-ca54-953e-734a71d76e22@quicinc.com>
 <CAA8EJppvAPmneYtixMhACf7NJdOX837UFuFdVCzbzBDMOSDR0Q@mail.gmail.com>
 <f2867d67-8b89-fcff-80c2-3de46806a590@quicinc.com>
 <CAA8EJpo+6r61Fcu-jzjdcrT6ifkmTHua5sdsuDpfZwZuo=JEBA@mail.gmail.com>
 <0a0ca412-bbf3-8411-5de1-155098b1811f@quicinc.com>
 <bb1b636d-8b17-6061-ecc1-8568bbd9e9bc@quicinc.com>
 <rxoicrvyx4vob3skbzrpnxfh4jk6talcn3pkkxb6pupnj3tykp@sppjerlk45ov>
 <1c7bd24f-8dda-60c0-b328-4f94e20592be@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c7bd24f-8dda-60c0-b328-4f94e20592be@quicinc.com>

On Tue, Dec 17, 2024 at 05:46:06PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 12/17/2024 5:37 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 17, 2024 at 04:27:36PM +0530, Dikshita Agarwal wrote:
> >> Hi Josh,
> >>
> >> Here is the updated pull request. please let me know if a new mail is
> >> required for the same.
> >>
> >> The following changes since commit d4033141873bbbc79c954dfcea502726ee278c5e:
> >>
> >>   Merge branch 'robot/pr-0-1734347915' into 'main' (2024-12-16 12:38:57 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-SC7180-QCS615
> >>
> >> for you to fetch changes up to 9778d18566912efa6c811ffde4cf4432a8990e85:
> >>
> >>   qcom: venus-5.4: update firmware binary for sc7180 and qcs615 (2024-12-17
> >> 16:19:47 +0530)
> > 
> > Could you please clarify: previously you've had the same FW version for
> > SC7180 and for QCS615, just two different binaries. Now you are
> > providing a single binary with the updated version. Are there any
> > additional changes between those two versions? Or is it just a change
> > in the signatures?
> > 
> There is one additional bug fix where some unwanted buffer size checks are
> removed for encoder session.

Thanks!

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
