Return-Path: <SRS0=y9Fa=H7=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A565CA5FED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 07:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 509791F00893; Fri,  9 Oct 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791529799;
	b=BuH8lrd26iJhCiivAAOVQ8wVj0DQ27R81lYrE5IPOGXHS3BH0ZUZsQk9oDsKsZdBwpnh
	 2gZNTcUDtBWX8wTk5UwBjNt7CQVxJrZOW3GSTpWxOkwMclDpJlIAwXh+FPAm5MzqH1hxU
	 c4ExpuWsA8978DOmQ8jttnM2XRMKPOkFZa92WaBFq6ik5KyV+VwIkFgcdStUNKa1usWH0
	 fcxDIGXk49ihrCzcoC+a3rQGw7fuoKTp3vcbvzPEPqwEPRNZDlr954Sl32SQDAnnu3JBF
	 DMPM+tu/F78AphPmN4bcI+xg1D7I7mIKlxcno0U9H/kWSUBgw3p/+GQFFG93Lqd3szg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791529799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tz/LeRERQg3zQSWQxriqFHQXIwxTY6CsspdrmIfUABg=;
	b=wCOVfsM2/Wep6Xg7SCyAO0W9NlUtoi6xiphlzkjmfURzdeQ1rpuCBCgbrpSEhIediIXU
	 xkMWVZ3ZeuOknqiNUWTsYmUveZZCrwFBCc3Je1gmXWYKun8pPWmfOUlwBbGdgpzFQNA6H
	 rfnXQ5X5pJf6weBvXbNIwMe1ZUmdSLMtPqmyGcC15fQuaHxJwddcoP/VVbWBdliIL+eID
	 kg/0dnY56ctwQ20QysgLwSotZ30rQNfwMVzDP58lQ9E3QD9w1/eEeemdxlXQInGBob3xe
	 PY/4hD74GLOKN4BJn+7xDqz58r2pvX5vN3jtUtvM5M9an+eZeTp0mcEIw+gf691Lu6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iCjsBQ7x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PeMdi4we;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90EC71F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 07:09:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iCjsBQ7x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PeMdi4we
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 90EC71F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLWV1089382
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 07:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tz/LeRERQg3zQSWQxriqFH
	QXIwxTY6CsspdrmIfUABg=; b=iCjsBQ7xtXjWVWBoQcEajblNdRXKP1epfhdn6R
	0BKr+/uB/9bQ2ltg8D04w6VkbfkX1TeDQmAPkazaH70TUR2jiOKUBYw/6Y3eZDw4
	blI9ZVQCHzNontQ2d4vsDzJ0Uy65YPCzEeHI9TmIAAZuBW4NDT2KPbx0BXCFLi6G
	mHvem7w9k4ZoAatmzS9xv1T6YOPwUJooxBMAF4bSWD+XOVED3a+U3sPzDX7sOpY4
	Gd4PYVXD1y0j8bu1+DZIfcFtqC3O1+4jvMcvXZxxCKJuNnGf3YGRg6XHbtnPYQM9
	HKcqQUCrID3+aTeM7FVruLhuXnO12FeX5xXogB4wmoUQqpnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvaq3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 07:09:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so6284080a91.3
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529796; x=1792134596; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tz/LeRERQg3zQSWQxriqFHQXIwxTY6CsspdrmIfUABg=;
        b=PeMdi4weZHNip6nmPonx5T/475mJimwDlfMgZ1i2kkya41L0nSH7BLGku2/eaCzySp
         cjrm5ejTZWSeX1KDyqaJ22aSewBDYIUny0tQferXywyTfQrmtdwKDxaxzJSQdl1E1GsC
         AhfqCPCAiQPWWaj+3IXsm5Dwj8dVDqlZyZJfOxA3c/8+UdZCiGiiKk89sUReG1/MTpga
         jn1k8qdMUiM/9HA0diaKnrzEx0AZYxjY2RFycBHYL+Ek0Xf0lfTQ/e0BFdTwM+WBdyz3
         9UE1mGS+h87KLYIeBC8209+t26WhQHIiizwZCOFA6YsjNzZeSsCyiZI56FCWhzkTVdRp
         /bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529796; x=1792134596;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz/LeRERQg3zQSWQxriqFHQXIwxTY6CsspdrmIfUABg=;
        b=n+SlFr+DBcAlKFL2TjserUougFFzyNL2Zb4Oi7KPx8CzJ0HEXOTVjeisH6ejgoYViS
         gNhQ6nEtfiATxA7/2JgLdOshO+VZ7ZN5CU/loAXVfeQoru3GbHhwuxZ9RHOGMVvkwEit
         1fNwFe7dilu0aY3oT3RzPqVWgpwqSa3g7mOH0SE7KRsRKL3FjhF80udWp4Oa5ucu6Ezr
         r+seu55wlx7jjPfx6fRZo6wb8mOdU4Ny6cx0kWcsY7tgyG/N/1AzGwT8nq2Gd0cypDIW
         fmRruAHOLuXJkpOl32oI/fP7cH+axc9ce8McXl4ZcW6hCfBMFlZqYbC4KBssQ/R1USNJ
         lkVQ==
X-Gm-Message-State: AFq9FYJHKV70r98B0JsEAc/OQZTUaSzfh04MTHCP4+WYDWdmZKCkedtB
	AU9gbbrjZzP6+HGaufTUl6T/IqbRISymqj3VwoFkGvz7J0M9OEay3ofusulKieVjfCTol9k7uDi
	PXQ4RKJ6nqsONCoq8VHnmA24lRltQlie9ltQZ9R+dclFL19M4w6wsN5PGnvhUZo5YIwCQkU0=
X-Gm-Gg: AYBFou0OZOg2X4AY16gFWTeiK95S3hbokdSKPmrwNegTcqFOv1xKuPOasuvRS1RAKwu
	jLCd87MLz4yVPRZa3jisypf+Bjk87y7rlP/wJZ9kzwHjSWgLD9sruvitc+apzbh8YmEjjI+hXV8
	0DHO67K4Dv6QOeDKoUNO/ZAbssRMi218B8eVVvd+Rda3DFOUdEFiYzNLKgmlGR3pl+XfvJ3fFER
	DDD51UB+Du3uWbSwdXcSPRixgBKb6dJmh5yR7/WlOFuDWGUhjq5m548j7pBUrUvAgHbSZaRy194
	qeGRb1UX4bAT6Rt/g9Hq3HIow3wqbV/GhmJIq/+T7zYeG35U+Z+Ki8OfG75A0tRe+Be+rjsbyOD
	bE/WFQ4XywFPIjbJSNtD+Jf5LMUc=
X-Received: by 2002:a17:90b:3904:b0:3a4:7195:ecbb with SMTP id 98e67ed59e1d1-3ab3a98c83cmr1042673a91.30.1791529796442;
        Fri, 09 Oct 2026 00:09:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3a4:7195:ecbb with SMTP id 98e67ed59e1d1-3ab3a98c83cmr1042659a91.30.1791529795855;
        Fri, 09 Oct 2026 00:09:55 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d4fc36sm490397a12.1.2026.10.09.00.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 00:09:55 -0700 (PDT)
Message-ID: <63c1383a-bc13-409d-8a3f-aecbb6a2e437@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:39:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P_vaKB9rYVXSn1-QTUy-XxuT-6gbZu5g
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac89345 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=mqz0OecafS6qMVF3a9sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX5Ga7ZNI46Lu1
 ELiWonmYOEZSFrEVPsbzdJFG2zgVvtASfljE4JgeIy3cCxMc3iXjdMWsJOsywjX0yrvv41asW68
 eYXuc+gpWIbgrsM+wABF+K0xI1wfJ1gBZ5BzhCzg6JsWPrDqjNgm8HhITam0TBwLNVM0aOmB42p
 oxd7iF0luGNSu7HtitVtuCnne/UFzTodvmo4XiM/vls6qsb6y9+tkYKVr5fisQneG5oZJEJiwgj
 amvmllBZtdOUZ3v132f52o2JZV6fHeImysW+rEd1KWm2kjYImKD8BTlodwX1RzMYqwUZHKinDCR
 OkLEdQPnws+kDjCToAPzUG6G91rkHG8Oc9RZYiAL+/cPo5O0PEVjNz0/52O8CAphy3Qlb1kQN94
 JTm7N9bsriDBq+Hav3lJ5YVZoIUQ8IROyy+GoW4ygjXTwiqMgk0Ajntq7wTVN6jw5hplKd50fP1
 0QB+3M9t09eaF7IOzEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX+fblAEsBfdU1
 lXZH9w6AV617k4q6dqvl/+GBXqfDRaO+xdH8gCmLafUWdrLf8Iz1ZdZ2mZfka8reC5F7CCUxozs
 EgNKbV1P+9zm+Ne+Hmq9CKULDTdCtGU=
X-Proofpoint-GUID: P_vaKB9rYVXSn1-QTUy-XxuT-6gbZu5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090028

The following changes since commit 3d352ef53349097f8d922f559c3ea96012c7ddd0:

   Merge branch 'robot/pr-0-1791489659' into 'main' (2026-10-08 21:54:17 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
mcu-fw-shikra

for you to fetch changes up to 3eadf1895677969e91cf03b74fa9fa1b2253278c:

   qcom: update LPAICP firmware for shikra platform (2026-10-09 12:34:27 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update LPAICP firmware for shikra platform

  WHENCE                     |   2 +-
  qcom/shikra/lpaicp.mbn     | Bin 1346527 -> 1258435 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 37808 -> 39760 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
