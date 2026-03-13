Return-Path: <SRS0=YDjz=BN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1832F106FD8E
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Mar 2026 06:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07D48C19424; Fri, 13 Mar 2026 06:50:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20482C2BC86
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20482C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tatx1176345
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c11wsmz5XIkmIWHXb5uA+V8l
	dNGjY2veRXDnBRS0QwI=; b=aGInq14/byGCOzv3tsTMhCKWaiSwvd/pEn5dbOES
	ko0+Bs2cEpWhpo0dLIsiTEB9sUKYiwmTUYmSgbslKM+rvCPWTS0wlgMlURYgltfV
	evrC3cCZtewgOK6TEByWwAfWEBp//baAr9dpO3j7SSbKCjkmIT+XtT5v2sfyh31A
	ZreLrRytvDD5jWlOf+ps5vGAx9hgp80yxTA0VDbSRSOBtUmQjHYNuTuhxSvkUTZQ
	/nxeDB6A5N9uLb6R0snZD9UhPn7eWBfRS2qUlDbElFTOOnD0TYngE9Q7LGn98cZI
	bW4Z7dhUS6Ii/2rde5cmdNiIZAxeVwSj3WwRqnuvda67Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqc9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2026 06:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fec8d44so1238801785a.2
        for <linux-firmware@kernel.org>; Thu, 12 Mar 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384621; x=1773989421; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c11wsmz5XIkmIWHXb5uA+V8ldNGjY2veRXDnBRS0QwI=;
        b=Tsm+/VPaRcNXlzBfqkRdyGLdqUotY6twjJqOvu8Rkug+BHB5JbqzBZkghzdwdPfr69
         uOfrHoKPg+XQ50QuKvQBvEe86HVlMWO6Z6jIR8PGQTmvoCY7CZOxo8ORTaoxnTE9yEw4
         E2PYSwfIv7GInEAnjpv2qUR5p26BJzoW7V5eg5rtGWfKok0PEoHLzuNM5VTVbj+Uvu1i
         nyj4TuIQ0+ZM+ADw6lP/l75XqdRcLIZGiL96Ua91dmirp4y5me9xax6YlLAf0HKrchqT
         jFG8YXMn8vgqNkwtR2d1CRZGwvdycArADIv2IuXQwhdI+Hma88o0zK+h2FuRV2cM3fTx
         hz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384621; x=1773989421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c11wsmz5XIkmIWHXb5uA+V8ldNGjY2veRXDnBRS0QwI=;
        b=sMkfK5oN9w89k3GYKbaB6IZPubH3DZ12fEkHInni0l6X4eL7PnN4Id/oFNZUcnl/A/
         3rEhUmqWFLfWkR0LK+rknbcTXr9b9oyLVVTs2REz2frXJz3877omwxbk3li5sZTUhck0
         aBTevJlT2GNWfcS3MjJyOpOvyPbW9JnUkabeUzOS6llKydP51IIgqtC3tvcCfJyOCopH
         yBWofr88FZosH0Tmamjyx34QjJYQOrk2a6SciA7XXM3uV/lAy6p9xOKh2r7kvBC0Kj2y
         AnkxkTOJUSvLXhwHFXVyvvBcziYYHKtnEzQLUgCqFGum7F3unq3lg6aQnY/R0KtoXzcf
         WzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSBEj7bwZmuysjHpoDrA85Y5Qk+l9JSAJOcWEeeneHCF4x5TE3eE0awfRpYPNhlCLAZRRJC3HNl7TmnImJiw==@kernel.org
X-Gm-Message-State: AOJu0Yyjffl19U6K7HnuwKaBFW3znf/IDfBab4m7xp4POXrfxPEud5zA
	sifiHmW7j+XneXJQqQbRB2MyKES2kvljsop61BpaM9SuMilXBxBFztzxU4Df5Ns3dCgjWI4DcLx
	NGjPlsz4Rw0Fd7zR+mGaL9baywezrRRzzGCVVK/mx1GHrK4hN+ymQkeTaF1x7Y9Q=
X-Gm-Gg: ATEYQzyFXdpDoXLPEwC6WMiTdke6+IliTyBewXuuPeQnI+naqr5Xrnp8n5OYYxy1bMu
	Ft5FfYB8+qd6nLFs/10zpMakjomz7TDFas3NcwuFgS22p4IZ6X6Oa+PemS9Bt6i5TJyXiRyirPc
	lESl8+JwO2RmMHLwB6NugycPoCOvr+5mRMy2gnpB+VNZtlJ1hMZJdGN3WaZvvGkc6MZk0X9Gjp/
	hqudLlTH1IUxTradQNS+pzDYkDVri8ohxP9/mm7UqYnwfykJBUaxICNGZY4SCvNySVYd4H51bvb
	sW/lDY1yxEYVdZz9TG17aMO3iphWxwdjJk7tHahThd9KmPlOS4cmdXeE0r1oj5tMYJkU2kO3owE
	BOAkzxDImXHZfrLw4rBNHrnurfLz1SJVbr0A2AaewJWnSh1rfPJ7tHHqLqThscjNh3jgoDOfYi6
	WCuJbePfFDy3BYlegXa3o7F023r0o1/jlGDZc=
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr316353185a.16.1773384621567;
        Thu, 12 Mar 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8c7:177f:cc1c with SMTP id af79cd13be357-8cdb5a060acmr316351685a.16.1773384621140;
        Thu, 12 Mar 2026 23:50:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2e1sm1354399e87.24.2026.03.12.23.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:50:20 -0700 (PDT)
Date: Fri, 13 Mar 2026 08:50:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: JB Tsai <jb.tsai@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Michael Lo <michael.lo@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
        Chris Lu <chris.lu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>,
        litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7920 WiFi device
Message-ID: <xofpo36rayp3hfdpexh2f3bwcho3f3fea47llk4cqnoi7qteli@s7neefdrmuc2>
References: <20260313005635.2853784-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313005635.2853784-1-jb.tsai@mediatek.com>
X-Proofpoint-ORIG-GUID: lqOfrigv5jk_7d_Km5-JYq8d7A24jW8U
X-Proofpoint-GUID: lqOfrigv5jk_7d_Km5-JYq8d7A24jW8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfX8fWiC/V1lnLb
 JyhgIn1JyYnXAYCOrM5Al6yjBr6ykkDLKOQvnh+eLvhI/Z3G6uQvt1U51e0kkyZj8huhftITeyN
 t/neU41IHJzFW4V1SQjMw729C3xwRlzVTBUGxIoNS0wKFk9GapK4PjpeRHUV3eAatpO6YQGYxyP
 5GQ2EoYasHZziR5QXKRJxiTetCi2e+kjN19dl65YSbRNoNsWBpIVlMg8MRZycfys+Sg2zNv2Mjm
 vKUUM+7QCy2Y6qbuG/QIv6dnhNNTy+QEVni2FFAf/VYOFGrw+HovdKoI2VCO3h/XzN83oza/+uf
 JSZLx+J0HCuR8QVwWKrorZ1sUlqHMmfIjP9f/ec217pDzCShEBgRF4U5N4B/vZ32GzI1ZgflKtc
 UcaPVXjLBcJBoZHi9Mbtl8mTYI73B1nSShuqFnhzbUwL4azJ3fgwdelhbU09EVM9wc4PHkqmjQK
 IvEYZYn2DgGKBwtE3Vw==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3b3ae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=mpaa-ttXAAAA:8 a=Tdx_NzqeC2gGNTS-E4IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130053

On Fri, Mar 13, 2026 at 08:56:35AM +0800, JB Tsai wrote:
> Update binary firmware for MT7920 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin
> Version: 20260224110857a
> File: mediatek/WIFI_RAM_CODE_MT7961_1a.bin
> Version: 20260224110939
> 
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  WHENCE                                      |   4 ++--
>  mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin | Bin 100384 -> 100384 bytes
>  mediatek/WIFI_RAM_CODE_MT7961_1a.bin        | Bin 802744 -> 802808 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/958

-- 
With best wishes
Dmitry
