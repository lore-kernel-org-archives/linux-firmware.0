Return-Path: <SRS0=Xjbz=HJ=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC19C982CD
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Sep 2026 06:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E1C91F00893; Thu, 17 Sep 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789624988;
	b=ftQOku+zjVf1Zl6SLvie70INUDOQkuwxF5Dskz8Rw7e4XlOjL9QBKjpm32O/D0pVG608
	 9txYp+0+tFc1zWjDS+2aGfFYC8IC9xc3SCLy46/uF0N2Yq/0sAW15cvHK6o55TtUHDXhg
	 xGeXuIQIglLDhGIJf+Le/TvzP2Jtl3avGTKlhTPN1b2pHILWwuOyJPmqQg23V8wZNocxy
	 LMp/JsDJZMRGMOKrmPwLXC+M8wYbJlzI/3TEsPEoQ0wrrik7LJ1y7aZA9ue0/TNNY+7Jk
	 IQsSmMkGR1/4sSpkDn/VbXCYbIIt5Ax+E0954qdR8e+vOTLGGWcsox6KFc5Srgx+5tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789624988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UVJbmr/IjhozzKM6ugCHVnsJmnOEX+0nxMHJIN/wE6Y=;
	b=PUCTY6UhBACNHY2Jq15Kbie9h7BxfovpZMFGpP0s0qNLk5sNj9DQRG51hekgrc0QHiOu
	 wUBnMBd2mXBniHvBs4yXJQ6yqrpZOsgUHw0yWww33FFFjOYYS7CviduU+z4NbXmFjYbIS
	 gAkLjVnGoCmA0WFJpIU7CotSjwpQhMm9w/kOTFjrk7FfalPCi6RXjqrfLnby6GwZlPJZl
	 PML0O1YRrGTAH7DGtMqHuM5kOBznDVFqLCivJgYYCgwJBUYqr/MWeVLgd/ub2NWrkOUqq
	 TOi1ncYC6p2ZzRnQavyG7prNs2+IfpUFjPyL16Ij/4byWELh+eRuTAjGqFRwAMhE0VQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUzzpVGp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gixjXDEc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 545EB1F000FF
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 06:03:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUzzpVGp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gixjXDEc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 545EB1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60sxh1375590
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 06:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVJbmr/IjhozzKM6ugCHVn
	sJmnOEX+0nxMHJIN/wE6Y=; b=eUzzpVGpHz6LDxd+NYVDRDk19/bhuXFAyBqsvp
	l2jbmMy0qsHbhimEB5wJ2O3eEw7PVqjonMjMWNI5PdLFuXiAezLLRkXlJVYrpETn
	J7AxOScpsai6EvCBE2eopAWsAJiYnIbyGEAyTUwQawMUyhcvdTQIQPsAJM5AYPWt
	pKIxdBSfDMzbeeRVfvak+YvFrQjyQdlULs1hMAvEeQviYDO4civJ3UAnFbVOYZnX
	VDZ9FnoFC68JL6EAcbGsTZf0+kcImYd0jYZRNfl7GT5noVbLPvvnU504eZVWWP7g
	WCbVKLteiT7V14gbxwBbBO6Km4sLdrkjF8Fsk7RAibEKqLHA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atmkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 06:03:05 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso917616b6e.1
        for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789624985; x=1790229785; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVJbmr/IjhozzKM6ugCHVnsJmnOEX+0nxMHJIN/wE6Y=;
        b=gixjXDEcyFdDrdI20PPIx9g/2t/fcoxd8jcO5W0Uz1pwohL4WnTdTKCCf6ygi0eikY
         MnKm1fTnjz8oiTefPRctDNjMYoisEgdb5jNSt8Ol0d+nrqsgsQ0qytoCHBpI+JEQrwIy
         1gqbaRElFqnvUtn3320yzGJbhsoWWYRBzZt2TCuAs5f4BooSGe2UAMWtT3I5zlW43LLf
         JdZFFlqoA+aaMFIfF/pQGzd1vdbkwKBiAG3A5tA2hnX2sEYAe2iK+6DwIJTZUt+oZ+8g
         P0DTg7rIYoxZor/7+sqAtJRBthv7x8RZY+bfnHWTV1zJ424n94mnuei/MJ48DJHbb+TD
         X5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624985; x=1790229785;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVJbmr/IjhozzKM6ugCHVnsJmnOEX+0nxMHJIN/wE6Y=;
        b=awGk0E3Hr5KDjJ8XsqsszDyEaJmpCHQ6r3c6uI8KZSmDKXFyGdhzBI5PnysQk9P4SY
         R8i0MBHHvmTvvinnOIH7dE2pv7fA/qvu3fh4N3F/EZvz2RSUgIj1IxlwCYbkqlcjbeHA
         WX5HiDBE1yrKv20szCQc2lrVdGSbAbvXL7TezbSG2WqZ+g4iBgU28tAi4Jrg5ya2wFOy
         xE8/es6DUb8xvaxbpfFZWwls4Rtuse0NRZeuEFeXc4tzwQMUNJwh2ZzkIisM+X+aTajH
         ylWEOAlXcqbV5LzfIFpRu4yzRePtnafdJQN4yNIfZB+B/BZYgIrBtBeS3MYGwsk4pOya
         uaBQ==
X-Gm-Message-State: AFuF++ndqoSYAJ6dNezvNnBqkOYAWMTYxJFWnBymIjsTHRZZiffOPYKl
	Fty10Xai87JktpkwH4FjEu2QzKBqzWyn+8K6iDxpbL1b11DHV8ASz3J0LXhw3tvhqJlHjIum0Cm
	yA7uyWpSDKNi4jUxRu/pJLKAx4Jwkbe8jhD8pA/vHQbHi/t75RlcLA42WF8Aewgf6zvionBo=
X-Gm-Gg: AYBFou0m5hENcHnduyioKmTzc9rJgAVZnZB6ObthUiKfleltFWRyeWLQO5OgjjFqsWy
	AX5QTChOllez44Hv0VnD4VhCTziJBLsM7QMLNnqSnHCSNXUOZ6UWKzql8ewkn1cDCgtJ+pRJ2/n
	YS3dBYAXA+cE2wQWsjXFdx0CKoIGTg3uTQwvi4gY1v+2JaD4gOakdkEQUATJqeFgNiOTLQ/8kv+
	jTfC6Bbx5P0VuKFvyBkfdw8a4PBCoVOUYuUd2RHy5yzOiXl6ck9/SWzpmQd+ksTOA7/sdxLdMBU
	oMFGf/7uhDsGnznS6UHZKPyHW3r0JxdC6wVe3ix6eN3YxWvKJajd773jSo+KYCV2TrwjXROcnEb
	iatPuYrQwlz6Avy0lI7JH7ZRLuAWD
X-Received: by 2002:a05:6808:10c5:b0:4c1:5e42:51d0 with SMTP id 5614622812f47-4ca497aecd1mr6386459b6e.4.1789624984849;
        Wed, 16 Sep 2026 23:03:04 -0700 (PDT)
X-Received: by 2002:a05:6808:10c5:b0:4c1:5e42:51d0 with SMTP id 5614622812f47-4ca497aecd1mr6386415b6e.4.1789624984152;
        Wed, 16 Sep 2026 23:03:04 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c01728a7esm10066631eec.6.2026.09.16.23.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:03:03 -0700 (PDT)
Message-ID: <0a89f2b6-6216-4a60-90b7-66110f713158@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:33:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for hawi platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fQ2jw_ro2AKLs06tzD8eMkACVP-19bOn
X-Proofpoint-ORIG-GUID: fQ2jw_ro2AKLs06tzD8eMkACVP-19bOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA3OCBTYWx0ZWRfXyrj4ev0KQtMn
 lj3jCQflF0HLvIgWL00psPVPigVgGy1NqzrCTMUZXiYyZHlBG9ZdA1aj9/WDmu99DkTNX9yuQhm
 v7mWLZe0H4jzEGrma8L8DvwPpb9KbPhSGLVLfYCFMcCvu+B1uf9wSfIuYi3JkjIofsik3idmOPp
 7pQWqMymLBNUWkKzL7+3IWntX5eWzslmKhNcNFzove91Q9lDTIhOHwndTEmUhkZ1SALHfmS68Ih
 HYQCIpHBt5HFvGZGs30wxCfbOhWvNttKcFP/8/9YwhM6c8tT3TmX5rf/nL6xtw3t8XCBsI+rn4f
 AJRfwDhPdewvZ1x6QC2r5cfer4xE0xAhs1Fc+NSvLCOSlwuWe779luTRyTSpNy7z0vQOe/M/a+g
 6wmQSsEHD0NIddmOrmLQYCYV47ntqQLJnT1mTK4PfC8AWFayEhPHHRTjpZHrNwyi/VO/yZSQeUk
 EcQzRHv+yP6x6SGM/Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA3OCBTYWx0ZWRfX+WKDdeYTjZIT
 wCTwnTmKdsRp/veU9gYFomLvTf4IqfH3RhykH+gQqEOragowOWQerWNuWzbAXuYrTbRnSgg5q2U
 xyfF07IaPVfOfuzxiU+dF6APo7HFNLE=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab8299 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=ofp4_jbnfg4eEjwp8RkA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170078

The following changes since commit e289868675d1071935ba4dac48acb6600f278d57:

   Merge branch 'qca-qcc2072-clnbtnv10' into 'main' (2026-09-16 18:24:09 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-hawicdsp

for you to fetch changes up to 5aa34a066e3d020cf3aa98805871786b1164a51e:

   qcom: add CDSP firmware for hawi platform (2026-09-17 11:20:41 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add CDSP firmware for hawi platform

  WHENCE                 |   4 ++++
  qcom/hawi/cdsp.mbn     | Bin 0 -> 5329528 bytes
  qcom/hawi/cdsp_dtb.mbn | Bin 0 -> 73544 bytes
  qcom/hawi/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
  4 files changed, 33 insertions(+)
  create mode 100644 qcom/hawi/cdsp.mbn
  create mode 100644 qcom/hawi/cdsp_dtb.mbn
  create mode 100644 qcom/hawi/cdspr.jsn
