Return-Path: <SRS0=s5Lg=5N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6B7CCF9F8
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Nov 2025 11:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42F87C16AAE; Wed,  5 Nov 2025 11:48:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9108FC4CEF8
	for <linux-firmware@kernel.org>; Wed,  5 Nov 2025 11:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9108FC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53sIBG3913967
	for <linux-firmware@kernel.org>; Wed, 5 Nov 2025 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rbOxD6KtnAQknVYE+Lms8bSj
	br3Up+i+2iSsWy3myZo=; b=W38n/8kv6j5gG2A9XxCVPRXDPQMjW2+GE+fyiQ4A
	k3kHWHPz30OUsxzG7oy1zqbAik60zK0hauElzoGZEGkifbF9qZqYxR8LyvTUjGxw
	kKvpTdPA5EBnMYr+o/5Iw5kWylNIo0m+HsRY/qIhVl8VHON6tdPDJ0vxViUuMJ7M
	fTdu0WSIMZtaCfnErKx3nPsYCa7UwhIlKnXwNw5Gy1Xlc/eOThIYhg8hTli+dd0k
	bVJ5mBpYTIrV5fyyBErnqswq0rQTY8emNRbvfRsT1PXYlA8MdZ6HtdZIdKYMgEYA
	0IAy2jpn5uyY39PpDzORGoax7SCozZwXSqIqgxEpCFhTKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y3795g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Nov 2025 11:48:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so54646321cf.3
        for <linux-firmware@kernel.org>; Wed, 05 Nov 2025 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762343315; x=1762948115; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rbOxD6KtnAQknVYE+Lms8bSjbr3Up+i+2iSsWy3myZo=;
        b=D27d3h+2Oil1OZ8FX6HuDhQ7ESlamGgrhvACAtXj24z1tpONwc5qbhUpnjNisb+Xmb
         esnaRt+rN1mztEBnvyZng+RH2jnoF3XdmGLXHAp19ItXQ8orLwasHaxsozh28rWoakEK
         ICMz3tykGhkpuZZxNQNRuR24jn6eQtFxqjbJ9vtMBM4HUGKuUDiDXUq5zc2gv/K8ToIH
         TsL1L/jVkF/M+HjnsCBPsQ1ZmpJrQ4gGbytYDD1kbzz8cLJZPGR7it4HsMq0SE4l3Hz/
         z868Ldcoe56n19c9FpqNtsrlcXIybdPhuG6rnMSP4KX/e6EGcWuBrKqmyLuhi06n8tyW
         FpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343315; x=1762948115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbOxD6KtnAQknVYE+Lms8bSjbr3Up+i+2iSsWy3myZo=;
        b=OXe4T9SfvaIO9Q7Kz0PrW5vq72HiYtxOgtIp+jkXau5x4+VIQITfnz++gX892sUmuJ
         RGAN3gwV9ZwrLUjRQz5bhmMJrt6kblIk90lFogJCmg2T/HzSzS8Z71egOlVrRcgnR+wt
         OE9HTblXjprQb5LIw5PF+fW6FET1pdIzRkyKd0TZDsUp70AmumA+Aiv0JzFjF+l/hwFD
         UYZcI5ccRctIM6LkWPjwjxKJoXEL9K+O64MrKPIJ6Faq7enm44PiZAtTz32e1EDr5bps
         Qlh4mZdvxOs5n4fwX++NQBWDUhAhsjCch2vjJjRvCm75eiKiFU1/Wp+8gydOGorG92Nz
         e3SQ==
X-Gm-Message-State: AOJu0Yzw/Ah+sM/G5YpyEHm/K78pEghkvC36w3oLPq9seQIdh2zRTZGZ
	gaSDQts3Hlm7lZRgJO6SuTh0PQAYDdbjxLDf8seKyM/sBE3PYhWBxxHsPHy+z+StlCnGb+y60kS
	+b/eMPGOu25MfmVVodcwZ6nkugmC74NCXWNCyPj4xA5UGzjyXK0mlaOG6KJYwUuQ=
X-Gm-Gg: ASbGnctiZelYDjeF2kL5XmHHFx/13mkhFaTHHNAuqdKWfNX3b9FIuN/hJfwwXQK3qjm
	WQcoB2iqrYs/dkh6SLIFOf+uNRft01BYkTqTTqtlBHELHuYnZgCle80npq2DZzgNxXNa27xKzhb
	0wOj4rqhObzy+ckmxzm4f0eKFJjR9tGrgSCEtIbPo+rgwzk3PwZij7bSwOTNi2iEIukrtKZ1Ucn
	UaW61xIRFZ/KIMBXOY849FozXXDD45r/80XzX3Zgpu+jyL0MSFl11zRIEvwb79YcjVFP53yLrn1
	ZHyfu1LGNTuIInr6lszlrIygOgsVuV868C+sniSEuX+6DqPsi+KG6EgKMJywROBKVJ5NVTKQ8Iq
	gqSS+40MFgVbGh0WCJ5+W9ycyRSgl0B+lBMNYRWw69XbqC2Y/0v89AjZNZUUfsW8LkDZgGXkqFD
	w+A3m419KbWi8e
X-Received: by 2002:a05:622a:394:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4ed72625123mr38754381cf.46.1762343314488;
        Wed, 05 Nov 2025 03:48:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2POzKxQIMqSTafV8HUIbshqx2biG/YuOvRxzy1tmeJOtES76UbcFeIUaMP2UqOWCPkROCtA==
X-Received: by 2002:a05:622a:394:b0:4ed:6ab0:bd26 with SMTP id d75a77b69052e-4ed72625123mr38754041cf.46.1762343313783;
        Wed, 05 Nov 2025 03:48:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59434456732sm1641589e87.102.2025.11.05.03.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:48:33 -0800 (PST)
Date: Wed, 5 Nov 2025 13:48:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, jiezhang@qti.qualcomm.com,
        chejiang@qti.qualcomm.com
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
Message-ID: <misqbrwxgfsw26lsnc2blorzn44m6wyrrstfzeursprq37uc7s@brxihrq2jc7n>
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
 <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
 <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
 <47006197-ef93-4199-8532-b8599fc82248@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47006197-ef93-4199-8532-b8599fc82248@oss.qualcomm.com>
X-Proofpoint-GUID: _L8Y9HIpScVmThqEcPXAjnLRg9g0wIAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4OCBTYWx0ZWRfX1izQAErSWhU2
 tfDp/50MJXz+X2yClrWrcavqOJkbq9fyVYYcDZ87at+jKDy5j0PEWwBnHX1FyU9d/BgLdxeF0Im
 NC0p0DWwno7xVYRZTk5S2HXsuHutSsW6scFtxOQJrxC2yQFb6qSGuFvg61cxmte078uF0t/Odcn
 Qs2DseRS1sjS+p6idUacxp6VuUMVHwgra5CoRKBCAykVTVKd9ryNLgS6qVWM0TMKiAQU/pspQet
 DX1eBSqGZ8gmY7qN/Dl59hMy0iXICmb2X3p5vcrs+v4Hi/K43nLImFkmGm6DDGJa2BNaKeKNMFf
 1HrmLZIziWfTYilKZBevTjmJZg/fpscedMh0lDzSlqJ+jxM6X5b1GYmUck0DmybXRcQSml89AXN
 ng8EUA+kGftd5x26r13SkRmHLRfB1Q==
X-Proofpoint-ORIG-GUID: _L8Y9HIpScVmThqEcPXAjnLRg9g0wIAi
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b3993 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fGdqCfwO-hhhPmS2ttkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050088

On Wed, Nov 05, 2025 at 03:27:15PM +0800, Zijun Hu wrote:
> On 10/31/2025 9:36 PM, Dmitry Baryshkov wrote:
> >> Customer did not up-stream QCA2066 DTS and also not specified firmware path
> >> in their down-stream DT blueooth node.
> >>
> >> Will change QCA bluetooth driver to change the default directory to download
> >> QCA2066 firmware from qca/ to qca/QCA2066.
> > I'm sorry, it doesn't work that way. People might be using
> > linux-fimrware even without upstreaming DT. If existing firmware
> > worked for QCA2066 and WCN6855, then the firmware with the same path
> > must continue to work in future. If you are adding new firmware which
> > breaks this compatibility, then _it_ should go to some other place or
> > use a different filename, not the other way around. The driver should
> > also be able to fallback from the "new" location to the old one.
> 
> We still want to convince you for this solution based on discussion internally.
> 
> Background:
> WCN6855 and QCA2066 share the same BT firmware files qca/hpbtfw21.tlv qca/hpnv21* currently,
> as they are different chips and have different feature set, in future we want to upstream
> firmware for WCN6855 in qca/ and use qca/QCA2066 for QCA2066. 
> 
> Solution:
> 1. Copy BT firmware files used by QCA2066 from qca/ to qca/QCA2066/, QCA2066 will use
>    qca/QCA2066/ as it's firmware folder. we will up-stream firmware to this folder
>    qca/QCA2066/ for QCA2066 if there are new firmware to upgrade.
> 2. WCN6855 still uses current folder qca/.  we will up-stream firmware to this folder
>    qca/ for WCN6855 if there are new firmware to upgrade.
> 3. Change QCA driver to change QCA2066's default firmware folder from qca/ to qca/QCA2066.
> 
> Risk:
>    For QCA2066, there are no up-streamed DTS currently, customers we known does not specify
>    firmware path in their down-stream bluetooth DTS node. For this solution, customer don't
>    need to do anything and have no risk for them. and they still download same firmware
>    as before.
> 
>    The only scenario this solution impact is that current default QCA2066 firmware path
>    qca/ is specified in their down-stream bluetooth DTS node. this scenario should be very
>    *Rare* because current default path is qca/ already and they should not specify this
>    default patch qca/ in their down-stream bluetooth DTS node again.

First of all. We all are bound by the backwards compatibility. Newer
kernels work with older DTs. Newer userspace works with older kernels.
Newer kernels work with older userspace. Etc. As a part of
linux-firmware we try to ensure that by providing backwards
compatibility and relevant symlinks where possible and sensible.

As such, running older kernel with the newer linux-firmware on the
hardware equipped with QCA2066 is expcted to continue to work. Yes, this
is against your customs, but there is no SP, no customers, no service
releases in that phrase. I didn't even mention the DT.

As such, the list of possible solutions in (my) order or preference:

- Rename firmware used for WCN6855. Use qca/wwbtfwNN.tlv and
  qca/wwnvNN.bin. Use any other prefix instead of ww. Then update the
  driver, taking a look for qca/ww firmware and if it doesn't exist, and
  fall back to loading hpbtfw if newer one isn't there.

  This way all existing devices will continue to work with the existing
  firmware files. Older kernels will use old firmware files which are
  still compatible with both QCA2066 and WCN6855 devices.

- Add new version of WCN6855 firmware under qca/WCN6855/ subdir (why?
  Subdirs up to now were used for firmware files for the same chips with
  different RF parts). Then update the driver, taking a look for qca/ww
  firmware and if it doesn't exist, and fall back to loading hpbtfw if
  newer one isn't there.

  This way all existing devices will continue to work with the existing
  firmware files. Older kernels will use old firmware files which are
  still compatible with both QCA2066 and WCN6855 devices.

Compare this to your solution:

- Move QCA2066 firmware to the new location. This requires updating of
  the existing kernels to follow the new path. It can be done as a DT
  modification (less preferred) or as a driver modification (more
  preferred). Anyway, using the old kernel with new linux-firmware will
  be broken on QCA2066-equipped devices.

After doing this analysys I see no arguments in your email to prefer
your solution to the previous two.

-- 
With best wishes
Dmitry
