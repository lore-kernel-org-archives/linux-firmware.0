Return-Path: <SRS0=w3AB=IH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2BBCCF2C4
	for <linux-firmware@archiver.kernel.org>; Sat, 17 Oct 2026 20:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A33361F000C5; Sat, 17 Oct 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792269453;
	b=OO2GazZkEq0GR5Dxe6b/z3UydjdCOb5WEExIt+XP6L1Fr6IKJXMyzJefFrem71HqeLfZ
	 QSf6ZuZCT4z7+hpSjfPoPl+28ZDGB+vtb1DGFYoMAJkxOoYntha+EFxJYPD2/Ew3fmuWU
	 uKpXrJkAmGH2NP2oMKAYrLmZmbLa93w1+dpj8ulngnc7GRy2W8CSXk6mCkOgPv4xZyZhb
	 cmJr8jAjENCYMyIMYmipGBL5RkVc7j+0Emyocyw7+9UbBuethIKdSWW9UShSk3wsCSM+A
	 oATl+eUnwRWCb3E350ZYwv6dErnVyQkdA4XPEWjYinJpsOe/zCWv7OsDAZcGeg9jYig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792269453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJhLBMHk/ItFuz5dehzrpc+coad7k3fTUmxn+/Q9g68=;
	b=Q7ZFj7Mssl/wAmOy6qsKjebqCepQrRAouZkCLs9sVbUCyDTfHFxgwL637eCue0ovxOzl
	 A4shVm1w663miSlkzW3SoplaogtrVnoZ/0Wy79loZ9tx3NvGRGRN0YWgRxMphjBMjJb2K
	 iwMKFXUOIKv8I3qO+4bgPHqaE/9tjlSZPomD4QNzZaWu20nLCg28funzPFQ3EC1R2eKpg
	 BOH9GLd1aajmZ50LqYNQ6sMxYM8fPzvQfsKa2pn+0hOdU6Lb6eDXT4FNwUhoyqolRFNch
	 TQnwpEbL4QXiqEudZ9CSw8toVQ9aIphFT2FBNlBUJYfkxzM60yotD7KVrf6qA2Pf+BQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0krEDSI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoNQMPgE;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E14EE1F000C4
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0krEDSI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GoNQMPgE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E14EE1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HJ0Z1H2380775
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJhLBMHk/ItFuz5dehzrpc+coad7k3fTUmxn+/Q9g68=; b=K0krEDSIL6zHn2lE
	yoKUGHiT4EKqE5+ouunqQbWLzZMk4kU8DxJ3k3tLIZYxta+wQ58t3amSWt1+JXz9
	qpjvcnfRiajr5XUdiPj/5/6nFOcpiX5bGXMtzte9xdsMQ4l5kxltvLYyjxKrYlEn
	AMX//nKa7MiMaPp5bvE6LD95mNtWTzAKa19T0W5s17opSnJneoZqIlL1Wdp+RTt5
	2QzCN94UwSt2PN9xnnulxNEaJruI+Tev7ioMY0hTSANeHtj1EDJdvN64TSyBDspw
	ZxV4wMiygxrP/7XiZ2LTwY0teuYZw6Q5EB5A9xOUEaylj/4l/FAYP1a4QlAiP1JJ
	3XYyOA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhrrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 20:37:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b875639ceso20786776d6.1
        for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792269450; x=1792874250; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJhLBMHk/ItFuz5dehzrpc+coad7k3fTUmxn+/Q9g68=;
        b=GoNQMPgED0FzDxi59fCy73acHR0VPGyYJXKFXTsXKbNrU6HKn1UwlRZrRpJqCfkOd7
         s1Lp+K7guH3HZwNMhMR/KYA8mM53TzSLPxTpar0qxQ02P8SafjEnLybNqcUU58Gn6I9p
         vwX1OQ8XDXltXPMQhsr1+pNfXHpCPETdsGn2nl9guBzPiKxadkdgXLeCRG6Eyt6Os3si
         yg7rD902IUEhb+WP7uBVWsFw+5+SJYR9ODdttxfnons5S1TRSjhxNQN5SL8D9nyLsVZm
         IG/HgqcZmxwt8KXxEryo2gvkEM5Re4eWq9H2RyZGwueTlgQYfVizCiZJGREWM63F87ci
         Em4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792269450; x=1792874250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MJhLBMHk/ItFuz5dehzrpc+coad7k3fTUmxn+/Q9g68=;
        b=uIyi746mCdUXBxUL0n52+VD/s2MZg/Pvw/6n2DvGmDs/Gbctr7B7bRQIpiqixiROUP
         2scQNoxjBSqW0MZLg9VrtI8T8oZHB9McodYrZ5132v04Iln7KuEvswMexyuSy02ZmFyT
         PkiAy+rWaqb+OInBJ32YSVG37C9pleMsZMUXXEo55IUgsn2WzLmxEHtEM3/ml1doQbFs
         BzUeePBLgGIVqilb4MFYRMzfQZS7jxWLDjL9vDg6mlICYqtlZ1vVQ+IPpJA9TwtKaNPF
         QeyB/Xz5ZYBjkmN+KDuL/EdqPg3ax2HZ9CYyVl9iJyldv31l7nAMmybxQ9Xn5aJjqMls
         CG5g==
X-Gm-Message-State: AFq9FYLJMoZ2otJQU3buFXFMkHnDDD12J5907I391N574PLKLre3vF4X
	fJnhQgT2UUR2h/MpIEh151yHtPAyIHhoqrIYJinMDEV5cjtRZlg/0jQNFbZn+kOgQNrQeTUVa26
	NO0rjuorBrlLaxbcdyWKC3Bqz1iyzX5S/sOD6yYSlm3cZIdwHpmma8A97wlAo0KsgQegcFAY=
X-Gm-Gg: AYBFou28yTjekJrNPy9jOwTJLARY0hE/sa2BlEHR9kHdq9hyWhY5krBIeSk097rh17l
	m4NL1RLYwsFjX7XQtbprfse2IIiMkoDaFyOANHqon+ghpgkBvLDS4aWS4iTFDnQNhpDyLQ6OPxh
	IPPdBXz9zjAI+Th76L3c4ztQEu9Wj/xKRuqCniEKxDZg8KAJePP2gSOGpTSglyI6CxhN9hbuw1R
	LlQl9KP2mtsH6vpuOCN2IOHmOmERF/6VGODyBYSHgZPuP9sM9b5YrPWhAWpb+dtmg5lDEhi4iax
	44C0ivw2lHj0ZVsznp6d6yLi6VyW6zH6++un0Y5TZnvGNNJmguHUNjspnZmCdU7ls0zYHCk7aaw
	FWjQzQ9wZRliOfQKtu7sLtKO7vvQaAHzyjFIDKDnVsdG1u9NJdXS5EAC3Bqxyz9dYj6kYm1UkgL
	1tlYJxIXlJYyH8
X-Received: by 2002:a05:620a:454a:b0:93b:c58c:d3be with SMTP id af79cd13be357-93f29d42f1emr640284785a.37.1792269449893;
        Sat, 17 Oct 2026 13:37:29 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:93b:c58c:d3be with SMTP id af79cd13be357-93f29d42f1emr640282485a.37.1792269449235;
        Sat, 17 Oct 2026 13:37:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e6b861sm15582451fa.21.2026.10.17.13.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:37:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 23:37:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-pci@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] rockchip: add PCIe3 PHY firmware for snps-pcie3
Message-ID: <oafuwy3x5uybkcmrmk7nbtnakbbt4aiiyrduqalhifai6f3prf@cjbg65wpvly7>
References: <1792049275-83785-1-git-send-email-shawn.lin@rock-chips.com>
 <cff4d453-2662-4f6a-9bf7-cb6e34df640d@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cff4d453-2662-4f6a-9bf7-cb6e34df640d@rock-chips.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA4MiBTYWx0ZWRfXxcLsZs19ARBy
 oz2Fm9uUeAZx87cnX2ZXyBfsBo/htYLBee5zonxRXXNMTvhw7dctKngnuaCpKaOh5xkOSXBHdpw
 0EmSsylZLcV8mm7hcLVq0Mxp1weTDT8=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3dc8b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=s8YR1HE3AAAA:8 a=Fm5Bng6jeHhnGR7Go6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4MiBTYWx0ZWRfX9/AseNr91HuM
 DdbS9iBlGiAesFjtA1TMvzvOPuRMSRFFfmCV3LN62apJeunb+o22tfrGTlCvcwirzVMtj1f7/Fl
 uV1WWTgf0QGbPv1oxm0jfXT6DMFArlJXe5xw6IceF6TulXACWrvLpt2XxES0wBIifAxUXOoG7Sb
 dPFEb/UsUmLyGKdTCWdAb15EH7AKS1EY9BBCQJaXuHu0twCLIOiXt+AxLAnHC7XNOkqGvPXHAwA
 gwK/JaBOHmbAAV9ungPJZt5yBE98waWog367tIN9Wy9QXfwL0gm7XunIi5My7fIFa+4/q80sPKh
 rNdwGidbIFZGrgc4urTa+P67WNasiZZtGsbj4PH84sfPmK4a9jyaWKzqQ0lhglUh5I7KtE641Hn
 CsS5qSXOp4hZzVPQiF5JUqRRdlLYP/a6YZ0AoWRqZK6NbUVasQ6THpL/Mjxa4tX+R48M7FPOzI9
 sho7ilP5BtdV05dkiQA==
X-Proofpoint-ORIG-GUID: t6ThMkd2QQfKu9QQukURMfXmZR-2Yil1
X-Proofpoint-GUID: t6ThMkd2QQfKu9QQukURMfXmZR-2Yil1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_06,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170082

On Thu, Oct 15, 2026 at 03:31:53PM +0800, Shawn Lin wrote:
> [cc: linux-rockchip]
> 
> 在 2026/10/15 星期四 15:27, Shawn Lin 写道:
> > Add the firmware binary for the Rockchip SNPS PCIe3 PHY, used by
> > the phy-rockchip-snps-pcie3 driver. The PHY loads this firmware into its
> > internal SRAM during initialization; without it the PHY may come up with
> > a stale microcode and fail to establish a stable link, especially on
> > RK3568.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1306

> > 
> > File: rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw
> > Version: 1.6.3
> > 
> > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > ---
-- 
With best wishes
Dmitry
