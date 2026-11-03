Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F0606A32F
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Nov 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFzZog9v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4vufqOi
Received: by smtp.kernel.org (Postfix)
	id DFA461F00A02; Tue,  3 Nov 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793709415;
	b=qJ64L+aPq3IA0j4W7M+dHi7WyEa8z7/E2KuB51y9JiY2sZhwyGmUrDMQygwt4xWXfg46
	 Lm7iICcd2P8UmKjz98SLtZCmqdaPqWzKFSIdA/8bMZ4d0OMZoKeVLDWJGXeOQ8Hic8Ko/
	 yZeesNaVKs5jNC+qQ9hluS1tKpkFt5XElZrb6q2h1kaNxmoxxv5V80GJ14+52okFpl8qY
	 AbFTVIPXKB5pLzYykmzm3OHgdMBpwNeNbgruVnEJfApQ0LW7akY54e9xMqVB0JPN05sSk
	 AEeaKZLdrg+s3H6Pj6G5fOPd+ihlSbdStTxye6tSiq5uoZnBZ2hNW/BzcGnuMefOm1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793709415;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YdTNlSbjKAQA/Rd0ICc4TVuF+LDoOvWMrn7xsf4363Q=;
	b=XTfQO7CnRjXeyukX8AnG2PKxXvf3CVuQ3VMpE2wcam/LfoHI9q+rhPt8puQUZuE5W5JD
	 IiaX7AKaHKROx/zdjsHiCrsin/CzpfRKahjmSUEYbYOHXmwNF8ZWj7EQxL1PA3SHSeX0Z
	 PsU0XRuU09EUrsn+5D8+Q8HAXj1YLTpVtahG4dCP+Byhetvv/bmZ2MqHNyoPAvNH5EMzR
	 6tkbLdzVxBkoOwxYeFrZvH05+Ccvf5I1VavrF24BZ3d6Ybkkewszf0Jyi8Wu/jvLCYS/1
	 KRQSdTn4oORNy6+NGxaKThTBce3bUR0WfERcv+bseYqJE7KZb3EQnXXYHaf7Rvuc41A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFzZog9v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4vufqOi;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B7761F0093A
	for <linux-firmware@kernel.org>; Tue,  3 Nov 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFzZog9v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4vufqOi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2B7761F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CPQMi3458161
	for <linux-firmware@kernel.org>; Tue, 3 Nov 2026 12:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YdTNlSbjKAQA/Rd0ICc4TVuF
	+LDoOvWMrn7xsf4363Q=; b=SFzZog9vb/n/8R8JVyhOljGbnB3xlIbb2cBbGKd3
	ylD6K1uT/VhiN6J1vYwciPMjzLpP/uukdvTEs6dtslCiS2jYlyqOABY4c+nZ40xO
	j1RNX3bbkfKKIxbxOsF3a+lF+ts9FZgXBO7vww0E7/T64lnJE0Gb6hmyDm6lba2s
	IB0kMWJ8xnhTxF9iD5lk6etfTw4x4HGaIg/i+5/1IjYSa86LZFfDt8CEM3uTWaF7
	HncDxN13/qdBnM/lKPvOq2rkrIHOzBfm0+b5Pdv+obxE5RLutw7hrxwSLAuOmJ0U
	MEYlA/QRZzefToFZo9o+t9qc91/5aVjp1F7S+DWG23HGww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9a83d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 12:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so767209385a.0
        for <linux-firmware@kernel.org>; Tue, 03 Nov 2026 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793709413; x=1794314213; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdTNlSbjKAQA/Rd0ICc4TVuF+LDoOvWMrn7xsf4363Q=;
        b=O4vufqOiW4o+S+/6B6M+5m9AoneouXnQQOx7TEeGTdNQ1tk8wrvmfsp3oRsnUCEcbe
         fC3K/ddFkCcff9UqrWbVK9IrYyLL9XvtO0lH2V8ulg5PlYDDFJ5ZiH2Mz0xZc6f1q+Q8
         5Pu6+FBR5l6Ao1K2u7y7A+x0ykPE1mA6nkwE7w0nPwoARlo8uhRsBo/YWKaudS0ymvGn
         dATqFdt57FvMFGAbcrAqweSIta/7QfF8tKonsOe2+C0X+1Mq4vACJYKbGj4fuXCM5nPI
         3XR4KChYzkiPSJHYgEPZevElI+7Kfx8iXuzGoo3+njzFckxZkLr9bpgpdqW2ed3xdYZ5
         YQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709413; x=1794314213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdTNlSbjKAQA/Rd0ICc4TVuF+LDoOvWMrn7xsf4363Q=;
        b=AhFXLIfgcVbKRcBtsb5qwiTzi16OE5QbxTiK4xlCdc8/G69gIMQj8mFugs/7SqW1fB
         pNwt1UZqiTjFMboufj9TwVtpNxvwMtfSo1tiu+tArz+1yvxvICDQ8T4tO8ujkmZ7W42r
         8vbBfWvmga5W48rIy2G3h3Pp8gqrRrlgBfeP+LkjnlgR5fUy8gW3o0bq3kE28BWm6Jaw
         B5hPFbDus6TDDT/WydVLikErUOCgHEuhpmO6HtxJtvunSMO3G1uRa+9a1S78sMQ4GuwF
         r6aqL0iVtK0xVCQzzqCiEwIOYQ2FyP82O6jcuHuEwCrzCYmvAU3i2P1GJ3GLjNPTg0CO
         3R7Q==
X-Gm-Message-State: APuU4Z+CBLfQRvW3yg0OmIPigwcQY9odptuhl2s9ylWjgf+mIbPvc2m0
	nE7zHzfcErHPECVR9TTLERzeG4Yz7iK4tmsdGAhU8Fr3xKPa3hKtzrM38K20X6BCnn8POljqKrr
	qcYmIVveFO2l6qvN7nlQTMCAjaYsswhtD+rZXkANjsRXh0N3hZfb2jh2QkXaOt/cPW8sfMrs=
X-Gm-Gg: AYBFou3Cebja5Mbzc1cxsllPalCyvSDn6xuR9CrJSdFtbtB9EOX4gsyBqNGpfG/pDlp
	xOnQZBGo9vmnLT2ZXCeluxeBRKmTuhvyf2TeiyjX0QzZ4LsKqSWwWB13VTP0dBCupY0xcIq2SWS
	mvfksEJuw7A+ST1WxjyVtpi84zK40JeeVaNf9cMQCyGMrfgOr+FeoAOBQBBKxfHwcjdK14pHSN9
	qXnuBu3P9w3eZkQZIa8KxqTCUFLc5ayiW/dXYRHQ5VGnEW6Ean4AwydYYHfTjba3p/S9eVsFTUL
	IFo1mOMpo2CTrho8h0UvQI54pBBT2AXgSvVyIvkROGdZk86hP7L+HVit8UH1w5r1FN5ScSP9tgW
	gbj0TRpdM0Mht4AiVKNpyRrbKi8+u3HNlGJG6ABoLvGJiPtoaeaa9gW5CwYkSGJ+n4Bwm4jElqw
	DhjMy70iZmcbppIBj8afQgedOP7Et47TCiCDHfhCxwBpC15BFoPd3qUDOTZlex
X-Received: by 2002:a05:620a:1720:b0:93f:35fc:5260 with SMTP id af79cd13be357-94421749f92mr2145916185a.35.1793709412987;
        Tue, 03 Nov 2026 04:36:52 -0800 (PST)
X-Received: by 2002:a05:620a:1720:b0:93f:35fc:5260 with SMTP id af79cd13be357-94421749f92mr2145911485a.35.1793709412487;
        Tue, 03 Nov 2026 04:36:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740446sm2158072e87.61.2026.11.03.04.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:36:51 -0800 (PST)
Date: Tue, 3 Nov 2026 14:36:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: Update HPASS firmware for Qualcomm nord platform
Message-ID: <7gx4ddhdtzbk34stsx6ni3vpvjs4hdas7x6epudqq2anims55x@x4qw2gcfkpqv>
References: <07f7217a-f80e-4d63-ac36-5466f30f5911@oss.qualcomm.com>
 <pwpkbhcdex5pf25pygzrl4ljcsxd2oqktpvwgcnoqc5its75cv@eh6kzao7kzci>
 <a35725c5-f54f-4c01-a252-3c9688ee15e1@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35725c5-f54f-4c01-a252-3c9688ee15e1@oss.qualcomm.com>
X-Proofpoint-GUID: ykvDwzB7pF7QhP4IZkQZNvLyUohPdKxy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX2W8C+jNhC4T+
 j3NTtQRZGBzXOMm5y3TH51gK1qOHKNqOeVc4Q93fpgnbcTm0ZkoxVb1+MgW6vvSPaQMv4IZnZT3
 DNy7CuF8W0NFHPBjP0RLjD/FSIBOvEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MCBTYWx0ZWRfX1HWjA+KpluB0
 xzaDjN00WVzKLaTuZe5+NA8XMaolquL0H9UkRvhvv0HBg2AVIyHIpH5VMJyTJDfbiBesZFmTi7s
 qGan9a9kYVUGaN/szA5JXfhZJ7rB5ReXPLhsfUQiJleOeMuubIeQptDs+4Y9Se1LC6/5/Rerogg
 8KY1y81EJsEXBUnJsGTNHCTVcN/B3VPru6aJQ0zZ8CvxLbXngKoo5PveheUCQWlMugIhD+BTd8k
 4U7b2WX/ImQ8Vx4ooz0uU7Y47YUv1wdEGyxRwcY3lTnecMb5y1/QDojXTqrMftQMtuN4mqqDu99
 TXKY4FrnHT8EmmGBJl9Jsht5ymgObxp08tDAK5LKo+mEe+CxmRuqy6DPxGdpiehBZItazw03cuB
 3/zrj+eUG9ybWsTAua8uVlM7gHoHqnNddsE+psHhsK1axNlYpeiQ2EXn+guRYzVer9MlwIwpaNW
 Fmg+mzhtMG5OTSyvkig==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9d565 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=2oPSMv1DxBlhzYZLm9kA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ykvDwzB7pF7QhP4IZkQZNvLyUohPdKxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030050
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 06:12:38AM +0530, Venkata Kota wrote:
> 
> 
> On 11/2/2026 11:28 PM, Dmitry Baryshkov wrote:
> > On Sun, Nov 01, 2026 at 12:54:39PM +0530, Venkata Kota wrote:
> > > The following changes since commit bda6eccc3a8f52e00696cf733b6e4f042d56655c:
> > > 
> > >    Merge branch 'robot/pr-0-1793289289' into 'main' (2026-10-31 18:25:38
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qli-fw-nord
> > > 
> > > for you to fetch changes up to 28013a9738ae2809faef40e1d1bda735af8dd011:
> > > 
> > >    Update HPASS firmware for Qualcomm nord platform. (2026-11-01 12:50:25
> > > +0530)
> > 
> > Why is the version going backwards? From HPASS.AT.1.0.1 brach to
> > HPASS.AT.1.0 ?
> 
> It is not going backwards. The version is typically major.minor.subminor and
> so on. We earlier created a sub branch 1.0.1 as Auto-Audio was not aligned
> on QLI with some concerns, with respect to some third party libs upstream,
> However, they have now figured a way to support with the supported upstream
> libs and we chose to move to the mainline and avoid propagation efforts to
> this branch. This movement to 1.0 is forward step if any to align with the
> code churn happening on Auto.1.0.1 would be a End Of Life right away.

So, the version went from 1.0.1 to 1.0. For everybody outside of
Qualcomm that would mean moving from 1.0.1 to 1.0.0, which is a
backwards move. Please don't do that in future and fix the versioning
for these firmware files.

-- 
With best wishes
Dmitry
