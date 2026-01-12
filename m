Return-Path: <SRS0=N8LK=7R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F12D2503C
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 07:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B358FC19423; Mon, 12 Jan 2026 07:17:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB9E6C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB9E6C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMbGdD4024750
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dN4Ga3eP1zHOFsLSV0SQxW+f
	xEdQVBrzglvws7THXcg=; b=bIBsMgKUf6tqyFU8PCnYhvLiXHSkuL38JCGI/sUr
	pSwKgYCs5VYXtz0zd2VFjyzXNX4wEo2R37wngZgnq4V9lnvYgNefRqD9lW6qbJk8
	KXuljnEvg5KwUwoRYKfrZpIVJpUFBWM2VtVACNWM6jPTJiABtgKya9t0s6NQga7m
	R61tUoq/15AvEybSdlrS2+qzkwVkTKrCtB7xYKl3fr6Icqk2hALrpfXttWkhnurk
	AaO5RkRj4ucEX7fIpVgS3q+WZV447g1SY2it9Ii5dDQE7C3T/L1gdygVeOUUTc2W
	M2t06sGsksnEaya/yMvDBBDMzLSShV+yM02WaNCd+ibuoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhakveb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:17:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so5584210a91.0
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 23:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768202221; x=1768807021; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dN4Ga3eP1zHOFsLSV0SQxW+fxEdQVBrzglvws7THXcg=;
        b=ZDem93Scq8qO0r4pqq3bc+FpIibOTWIN7Mf5IdONU2ooyoPuqCBSUO6OIVlaL4xiuq
         MgSAXONutrkO7cJT7rFzAGZDs3/doUyHXI3nrSznpwNWEQ7+IrJk2hJClWNAhO4CX6U0
         wE3tbGbSXzqC68II021iDrebRv45FKcK7pmUGSpz1Cf5sD3bnx9NAJbC9nP5OpfEWVnP
         sCkL1lO0Zy6NF2G5zLdHdV7ojNGzjrCHaMegv6Nq80pbGwJ9n92fn8PL/DdIWyTbjFxu
         pu787s55Jz2smysNnFck4qVHVWUh4QwCLEKEe41BL2MnA+cwqe7Pn9YxFZVojXhgrZOr
         jcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202221; x=1768807021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN4Ga3eP1zHOFsLSV0SQxW+fxEdQVBrzglvws7THXcg=;
        b=nxtQhvouvBMGXDIYexcJjRgAcUUO03gcJDvO5coX7Kk4+NRJ0yEPyXTYAYgTv7E21G
         x0cWrR4lcrmbiJlJzzAI9yJix2F2qjJIy9MHlGsRskWWEHNCmHACA169Cwq3pHwHR1Et
         PgBtxf7lDUqjI2pEsfbw+IQnR17I8qgCbNt3hjX5LwCy+cTel08KP04Kvf+RoSa1H2U3
         ugd1EYJ/vwdj8mq75BSR+IlTkiAyIUfST3pEUOT4N2/YHQIohHHR7CWOcT5weoXhQTzS
         yH8Bth+FsrCNvBqDvJCW9N0k6wfE2GCheKMAD/iV2X/NGxYBdyXxPifgZG9z/J0KVsmJ
         C4mQ==
X-Gm-Message-State: AOJu0YwE/nv9VVRL6PtLTWE8PY3o1LPmd6qKXyqv6p7+vBDsfUVvm0N+
	2FMywjKeJ0fFYDwm4gYw+fND0SLRc19DGoRlB/iZRP1E1F1gpz7yhw65Y6TwGA/oRLt38yllJxc
	cPKJEENCE4ZRCoLDoNRcny5n0RvHxw91xYhEUY1qrh6iDtvcpWUPdR3VomBt1rdBpwVdboau3aY
	KfZ9LMi59hVNxpsNOexGJjoEvteiYM9CrzAgiM2g==
X-Gm-Gg: AY/fxX40yN7BV/IFbOfj335Up57+TcmzWK06lfSfab5nkXazUUiAuQ2yyh5SHrwiTOk
	kCnVlJN8KA7k21QuoHp4C/XEHlUE6E0+1M+/jt0RFwXn65a+lZtLj5EVc4MtC7UpZBrLGIDFvdb
	Fkov4x+J1gvATl/4h6M7SysYBgMnEInYkwMbRHiiA8JWsng3Bx0hvlf/cbTQ4kHDoumuPdSfc+8
	arBW9nt
X-Received: by 2002:a17:90b:4acb:b0:34c:fe7e:850c with SMTP id 98e67ed59e1d1-34f68b4e4f6mr14714307a91.1.1768202221350;
        Sun, 11 Jan 2026 23:17:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ0U5WPjjR8jRAD9rULoUvFe/LzPkWzSjiY/83SbSJ41dNPgL7CAwRyUqmqhg7J2aWqpWdPdBwTORnwpHTjQA=
X-Received: by 2002:a17:90b:4acb:b0:34c:fe7e:850c with SMTP id
 98e67ed59e1d1-34f68b4e4f6mr14714291a91.1.1768202220802; Sun, 11 Jan 2026
 23:17:00 -0800 (PST)
MIME-Version: 1.0
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com> <psonfqdp3driwwuo3ihs7u5cclt4exo6khaapyd2wlagcyq3ib@y4cratso4m7v>
 <64b48dc5-165b-4a90-805f-37f76bcc352c@oss.qualcomm.com>
In-Reply-To: <64b48dc5-165b-4a90-805f-37f76bcc352c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 09:16:49 +0200
X-Gm-Features: AZwV_QglZ971jHNnzmSMD9Bk-Hnr8C38HK-jBKwtIMnV1mEDK2mKgaBPWBXb-fg
Message-ID: <CAO9ioeW6de4VJARv8RYid7H3cLCYXT+ZwLAay4wjcWCjKwpWQw@mail.gmail.com>
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: oOJ2fXmxpK5DQzODqL7_d7Gdlleh7ybs
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69649fee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Ip41j0JayeJbVSywUo0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: oOJ2fXmxpK5DQzODqL7_d7Gdlleh7ybs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NSBTYWx0ZWRfX2jrXgjX5yOkm
 XegaxWUKFnBT7Duw7Y3Y0P7cBdckrP4Qv2UtIyxqJn8t+pGKBm2jmokdA+RWaDrLGe13Cfxt0q4
 SlRg9qxR81eLJ8dpZy8KGL/FPc40dP0r5HqvwEh7TmKdcP1QdKuekHsCfuMNO3q09ulNHW773U4
 LLOntXasHfhfZWah9DG3GXM4w4Cl9xF05V5NgAIK42jbKXKQdAIIumKee8GbAE+EIP0w6oahBuu
 ZIBkf7zVoUaEwOUVdny9sNRwksy+Yn1SiR5EOeX4DoqDPckBOO5hRbFyJ3VrhyEjd3c+ZbHpSxh
 DlnS4ALiHIUJN5CP2aBiAu65ZfduKZ9pWvBYaDjIoTsMCUpIvvWqIWYxlF7HgeqpLdKC8uTnWLK
 fcJfxP4wu1iTwRQzguQ3eFoF16J3yENcQJxFTzCz7zUOxpVlCMrsgyJxkWPzZNOiXVYZTQWdEwR
 Ang3ANP36P+RAGHWsWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120055

On Mon, 12 Jan 2026 at 09:16, Vivek Sahu <vivek.sahu@oss.qualcomm.com> wrote:
>
>
> On 1/9/2026 4:46 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 12:24:58PM +0530, Vivek Sahu wrote:
> >> On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
> >>>> Hi linux-firmware maintainers,
> >>>>
> >>>> Here's a pull request for btqca bluetooth driver. Please let me know if you
> >>>> have any problems.
> >>>>
> >>>>
> >>>> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
> >>>>
> >>>>     Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> >>>> +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>     https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
> >>>>
> >>>> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
> >>>>
> >>>>     QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
> >>>> add required Bluetooth firmware files for QCC2072 uart interface.
> >>>> (2026-01-08 13:20:45 +0530)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Vivek Kumar Sahu (1):
> >>>>         QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
> >>>> will add required Bluetooth firmware files for QCC2072 uart interface.
> >>> Oh. And your git setup is broken. How did you end up with the SoB not
> >>> matching the Author of the commit (yes, I really want to know, how).
> >>
> >> my gitconfig file was not updated with oss mail id leading to this issue.
> > Are you writing the SoB manually? I'm asking because `git commit -s`
> > would use the same Git config for both Author and SoB.
> Yes, I was writing it manually.

Why? `git commit -s` does that for you (add an alias, if that's too
long to type).

> >
> >> I'll update it in next commit.
> >>



-- 
With best wishes
Dmitry
