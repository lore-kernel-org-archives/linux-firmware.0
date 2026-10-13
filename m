Return-Path: <SRS0=o2s/=ID=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4B7CC6B03
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Oct 2026 07:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75B191F00893; Tue, 13 Oct 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791878361;
	b=uyv4UM+G6HS8/AOq4+lMqGHXdpBSR4+s3BRgEG/CGguDg7snBFPdXZ5oT/nnHqb1yf8V
	 kB5oWJBwK67KgHhfjQzmujILmEpmoF6jNHud3epZGtptKLN1s53A9Ha6lBrk+z5j6OcdX
	 aiFDNbMi7ZWBCG35VPGJQnjsI9grUbdw5cQI4keyyV4DQ0N6BXENsz7JLS1uSlCFfJhcq
	 XItR4mfIHU6T9DN5XNwY1lWozOioB4AJMv3yDgdCVdyLZ/uuGbWjQRU85d3ePSaO8KccP
	 WQ7X/bf+d8lwtFqJpTWVt/cCl7rzItwQAzbniYK+J46AUOF8wFjvh9YJnDfZH/2macQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qNTwnyjl/C2udPwdT46b6uQYdQW0jy27ytL6az/YkD4=;
	b=Kw8526DoSyRpQARWWXUskEshV5Ch9Oi4frWR2MULjMWZqvlsOJAqzd32ALJeTzwSSX1e
	 42zPtvgJUvQkrSSW4QGA+apBC6jsZSEIfOga4XjJ5S4Tx4Lvm4aPv6JP3/Uymx1w9RaRI
	 SIxBkX3veLGYhaLbUq4rlPcKV6iTMduAY+A3bNxjc+EOul1y1m+GNqhd4JyHEOs38fgjI
	 BEhyFogpI1thBxgPLG89oxu8X93ZEwIs443B19950YE2BGeR24RSSo3ewX/hhIRtDq4WH
	 uRPV5Wl1elV9/MDr/Tefb4vUfXIvLO6ceOU+ILTL8y859NL6D9CzSUtYZQ8QY3Mc1+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ozNpohWv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPeMUZLG;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8DE41F000FF
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:59:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ozNpohWv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPeMUZLG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C8DE41F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Yrve3208361
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNTwnyjl/C2udPwdT46b6uQY
	dQW0jy27ytL6az/YkD4=; b=ozNpohWvboQdMA5DjIQ0CIP7DnJKWPTAEMgMXw0o
	ENdKW8G/mTiKIJhejLPT3BzCmxLIEVLtFuAoY9f1H6aqPhAiFFKBdNjtZdoNhoB/
	vpqQ8ciDKEyi6+RB3SN4J1NyBKtt8RIcL9vecEQWv7lDF+7iIIel2TWURvhtfLyY
	qtr4g6bcw427jBYZvlD3N00p0nclq+omQQDr6zNdLS//rZdX1ca2ldBvlKEpWbdx
	xyM/yngn9rf36A2jRpYdkpBUHTA+zF0jZIg62RnjGuP4KSNK0IzwIlkUZQeZW4n8
	vwymWgdcYFypsxpyXM0EaMPyV5x/0owmqnnIJhWynZ7+7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjganj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 07:59:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso512106085a.0
        for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791878358; x=1792483158; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNTwnyjl/C2udPwdT46b6uQYdQW0jy27ytL6az/YkD4=;
        b=TPeMUZLGuKrArfe5KsxZPb+Um2VdkdJG3Q9Q4Mo+SxuPcO0XUezRYDyqnYRklrygiV
         TLcI+I0LcRL8QcbpssZt31QztWQBjj3CrKiUu1j3e7bYNBQQRO0e+f9rJ/x7ML6uwtZy
         hZCoLWIpEewN+O7waNJa7DJh9pPVxwjUWL0zjXc6GWEz5a+SGn54uOLJPReX5VqP84rY
         HVW4u6KFBLyB8wc8hqkPReyDHwxiN6xHHIKYjvoT0e9T68uTX+FJDPyoOWPu3YpDpDQq
         Nt8uPswFMMjQxt2cZMbr22+fNouU49TxZLG0/h1WBOVVJNQ4hUd8e4c0l7mZjullpFJH
         A2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878358; x=1792483158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNTwnyjl/C2udPwdT46b6uQYdQW0jy27ytL6az/YkD4=;
        b=q3Vm+tc7zdkFV2ikXpN1YZvgMsoIbk0B+667szMXWeugCGlYSJlTIfjX9doDLWREUN
         YsO7h5YNG2ZBpATmGeVCXOtgASjOdnOe22yogdjlqHIUd9LA2c1L0XEk7pYcgFaVn46I
         gCZ7I6DbSepCuH68IwEQ0++hL9LOotFrdoazxpqgQblM3r6d0PzN8HfTs9/fZ+4tnBAl
         JJab/I07p3P5bugfKzGWxh/2/Ex1r4kvljPcqRuczxRpP5hUpTJ2C8QfamjA2vjSEMSj
         bYUnnDdLaTJhNlIKLLYI+MXt1oA8i7DOs2j9B4mjOxfkRF/29Bzo42e/TLDmVbih38e7
         3Ttg==
X-Gm-Message-State: AFq9FYL0ujD0zYnoXLYG9EYGH3DeOVXHO9a7cqHEWCy8jzOTO0jwfFjU
	2YxZUruFZXjUlmMf+jvSX6C7Wsn7ELYhCiJcJikJCzXkYh/as0N+1faJN7PqdXRVOeec88zKuWl
	CP4JZRNT6GAAqOAS+saOEJvgaJrx/V8UROoPLt/dLUUUkGfJkWPzl8Uwj9+EhVhM2vmWsqzQ=
X-Gm-Gg: AYBFou05qFt+EntfmPlJLjckflz/2994JjOy/HCnb7Ih6vRtKcY3AnIAhjFp1JZShyf
	xOVcphtQpGauhqQRIOnqXZLnU+2tluIr59FlCagF7AT68fhkq3hrFXrdr3F2bjyaJTDwbJMOZ05
	Dgef1GhDobXwig9ZAn0Jfv64g6LxI2nEJwnHPFUSi2Dcg8P2+GlcWsuhM9AlAWvtHbTxv538lsk
	E1eiEHqgbN4H7fyB7Oyac12uQfLTCvyRZ6FvhTnNDNxSPfL2upnGny3EPOESp6fLZpniNR0b26F
	mCNUXcouBZTnbaDcQm+dxhcxNrBtyEi0L9rlC4NzhnX/7muYMERahm92gipruyaP1yt2lrhAVd8
	yezOjNwQfxBugXOhbWxZwfdt3XuPrLZu35sBMNgJHtleWnQsQlnho7w8WLTARbDtWAbUP5INqHS
	WtuDfWlAX2s7kv
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1786475085a.52.1791878358434;
        Tue, 13 Oct 2026 00:59:18 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr1786470785a.52.1791878356738;
        Tue, 13 Oct 2026 00:59:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc57fesm33342461fa.22.2026.10.13.00.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:59:15 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:59:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dbaryshk@qti.qualcomm.com,
        raghukan@qti.qualcomm.com, rajup@qti.qualcomm.com,
        kbajaj@qti.qualcomm.com
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <2lmzlkssk2dfqhsfrgfifxf26273ud3brfl3qarvrcwoi7crn3@sxjejvmoftev>
References: <6071a402-62a0-4b31-8b27-8806236d7e6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6071a402-62a0-4b31-8b27-8806236d7e6e@oss.qualcomm.com>
X-Proofpoint-GUID: bptIvdhSdwdwHcrtHPeHxsHduOepqi8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX7ZYKGvr0cWuD
 aWYCi30dg02+IN+aub2a4NQp6iVoxFFN5W0iLEV3MBw3+Ked4CoZ1IAEFaoKHTTRp+ZCoA3ard9
 oA8tb87HfU6W6bLTihxGwcuU+GosLgQHvplo9UTo5y0G3JDrN+Vu2oZ/s4rF6a6vttkoClTYyAb
 imS31YzN6T4weaMmjOgG+Q+GMetBpoLcCSU4nyvfwFxobipHHE1e5WeQQxi8tJ3Q7E4FjIZe1zj
 uyFoCDPeSU4zv0d+Veoq3LTOJ/S0qbgxXnKdEAuWnvLImG9K7F87D7SYUEkkuh5XNldt8Hd77So
 f6H7eX+DzIIx/S5Fu06oWNj+XlAE5ejih8uNGgJC5w9aJKuM+51y9j+QPH0DXeySiu57bIPl9Jo
 f/0H9KYvG8JRm0iwWKoVyoemOigohu9supkJ9erQp9sR+9FWSmlVrOD43Iu6HXMNcVTMdCdZlKT
 qNSnhcuKRZ3kv/8IAlw==
X-Proofpoint-ORIG-GUID: bptIvdhSdwdwHcrtHPeHxsHduOepqi8h
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6acde4d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=1WJQNwS-_nXXn6iDsyEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX5k+9UHRVXT+k
 RsMRNojKPz37jvxtxEavSKM6+o+oOCr/3UmouiqQ2jx7X2pngC6b1gEbWkNtnlrcuiHwQYypWrQ
 AbpjvWYP1VmAr4UUxH9wavPMtQFTex4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130031

On Tue, Oct 13, 2026 at 08:20:02AM +0530, Srikanth Katakam wrote:
> The following changes since commit afabaf773c4c2e2c841429933a6a084a5af4d14d:
> 
>   Merge branch 'robot/pr-0-1791575572' into 'main' (2026-10-09 21:10:55
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> modem-fw-shikra17
> 
> for you to fetch changes up to bd6f0a206fd33a9f507f5aea181262c898e6c18f:
> 
>   qcom:Update qdsp6sw firmware for shikra platform (2026-10-12 19:13:12
> +0530)

Thanks! Merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1302

> 
> ----------------------------------------------------------------
> Srikanth Katakam (1):
>       qcom:Update qdsp6sw firmware for shikra platform
> 
>  WHENCE                      |   2 +-
>  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5668216 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
