Return-Path: <SRS0=B8UX=GG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF0C5CFEB
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 06:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DB7B1F00A3A; Thu, 13 Aug 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786603650;
	b=oLop7rq3IT+o3J4jitMX3qzoKpR8eFT9pdN4m9mxMe3995aoQKcZdSeE6PcqgKI+pJjo
	 Mr45WdjMHCxZoexbCdyygKPr6guje7tHJc+5RwvQya1RXg5OuWC7F35vQV8qC0TS+UD6t
	 iee+ZoYrpZDVzwjrtBpaWTxenuXy3yLxTD6Y57sUCtONC5ZZpdB+CMR1DLDdXOaQJSigW
	 SA4XoB5X1XCdgT4y1cWiJQIMfUQoZFMLM9KpjKXAfLCVJn+ztuIFFQ1gCT+oqvZVGzRhw
	 XkfzuPkf2EtMTiRjpEyBg2WLfy1yMStGSaJv4NL6LlIhF0naMXkSFyQRqCWVHqsIESw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786603650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kIsMIsB/Kncl7R0I9dHWn6+v5azbYxxBMJDITOaYMNo=;
	b=g9JDLdtRLEKeqndzFnSujkHZF4xvv14rFFy69PkHC2aXBzQLSji6wlXzhD0JKg6b5oyB
	 rO45VHPh4XHvv5beBK5d1muS2leFR1zw/NPgwi1H1WyOYb0Pa2LmSfTQB4FjWmYOm8I6y
	 t+wVP14O0kPoxjSMdV85Avij1t75wjSbC08H1kK1gaAq8orm1rqWhBqrsRsbhe1KEbw4y
	 QZ0LV/GchYBptpzBZH7FRhxutRezfd0iMNwWmWPP6i44yc8JDdcNCfhS7iyK2sa0f54e3
	 hcMPefUoxNpK8V3bUPKRlvPM2kc4WDlzr+G7Px3CzLAE4Xs9ADX8RiZgR60ZOZaT7AQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBF7Ob+a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=co7CHw07;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 819371F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 06:47:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBF7Ob+a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=co7CHw07
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 819371F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5gBuH1832118
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 06:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kIsMIsB/Kncl7R0I9dHWn6
	+v5azbYxxBMJDITOaYMNo=; b=lBF7Ob+agijiyvhuHcIAz2Mzkb7yYiKT3XrAan
	hz4Z3qBlvgeW00J3qeuaFq5Dhq5HmiPsSPKz+p0iUPpxp9a3b1ySxAgnVOeGqUbt
	CL6/Vjtvpn3i4A9ESxv0MQjLfEcNxzivA+Pf0zPInsm2seDOl8wHEXgRru9lQzTF
	qg0SMCJj2gf+0yb1TpwprOun++tKFrvx+s9Clqb2gftXuPH+fvxNU3WhCUX7CW0v
	9cPyvPY/3IFMHN9aOMeF80zwfoeI8TPQxCeK/cdQ/SCKJg/6HY7i3WC60lQ93XBw
	vd1lGIHRb78TzrCJ4VCTbF2KRPWgni0+J17PyfB8kJRPxBCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04j6qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 06:47:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so2729300a91.2
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786603647; x=1787208447; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIsMIsB/Kncl7R0I9dHWn6+v5azbYxxBMJDITOaYMNo=;
        b=co7CHw078G6ufl1C+oC5GHlqwBht0aXKuGC3wvsd8yKK7AbU+SOVf9I+Yvs+IBDQ/M
         RT6dtF4WLmcbmzVo9VjSBYuhmJU9TE9Yo+eavbSCrF6q7PV9ppxCZywq4isXX2dAkrek
         0tDsK34+IGxsE4+yWhR4soKVHIvkPUXg5R5FCpSjgjJFlyIoy4LxPdl4D8xVLLCot7dr
         75ZnBVfxFCgObmruMb+5HRQzEoR1IIkH13qhlnsC7+k8Ahg3DxFSWMuPnJ4iuJBzLupw
         t5kS67uKkYedbnjidaMNCcwoChA6wr183GSMQnjUbF/OUJLal9PLrxdUsv+h9hTOoy2S
         DOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786603647; x=1787208447;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIsMIsB/Kncl7R0I9dHWn6+v5azbYxxBMJDITOaYMNo=;
        b=g+DwKAluTdrR4ABRcDr75I5FxWA0dnkCBmwXgC8Qd1zVDYnBtQmZI0+LboM2IOYyaZ
         bFAK4F4LqPIMX4Fs1F7oxNFK0TYcsAotLuqmafcxj9BDGy1iCbxvWUtODGuC2Bmp1dq7
         WQSfgOS8ajjdiW7TsY5eslBtQNdSeCP6hUgM5V1Id3eqoT8FcHw336T1w88UhVtgtrfD
         5G0GqC6bR73Mg+KgieNRyJ55IWHwTWGtVmDradozAoKVEbrJGKz24p1TfOd7dOgswBre
         6W1VIVAMY+6IdtF18qz856k2V1aMo5fnJYx3FWx9c7hyURalHe+XJ9zLWEyOK5qIudlf
         VeWQ==
X-Gm-Message-State: AOJu0YwVB1jIQv8G2OmMp8B6z6gNwS/wLUtjKS4OI6UmoF+qOgPJUJAx
	rvWjOZJr2HTYNuUpmwsFzmSs8lRLOSPPbscQkN1V0nZ3OUNisJCTmy2UZq6rklFeudQzR/UovQw
	0lnouS3JITo2MlNC22MbqTFTYmszmZ1yjmGxa8qLLk/CQWH2KUEuZELQ41MaQi2X0u3jYRLA=
X-Gm-Gg: AR+sD10IhWAiG6Ix3vVeTBd8CHe0lYGT4rduBs292NI34CP9d8TUvLA3yVn6fOQh3Ts
	APL/Qoqe6iQ9uv3En2WPHW2FzAAB3OBJAfkxwvEsGQTGwJEKCsdql11fWifgO0K8mPphI+yPIU1
	W+E9ztipSf3mxXEID+SRD91Pu9dO62zjQN+6hkYxTeN5KGHb9tVb9hmrHghoJPkG8Rgz8Estxs7
	brBHzgjZnG7Un+L2gmhj65M1nEVSV74FnmSe827b6MazSVcg4lKHUBhs7guKjiEcG6jGg9a8oaS
	5wu2su1k5YLwe1lTHQj8en+QGdjQdTObJToJJL9/lU05wVbAGdusWjHZD5Op4moOg5icKIPEoHb
	9/RgE1//mXOTLL5wTD6ARBlx8KWh3
X-Received: by 2002:a17:90b:264d:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-3931dffbf64mr4684109a91.3.1786603647238;
        Wed, 12 Aug 2026 23:47:27 -0700 (PDT)
X-Received: by 2002:a17:90b:264d:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-3931dffbf64mr4684043a91.3.1786603646728;
        Wed, 12 Aug 2026 23:47:26 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f26c9c3sm1651264a91.2.2026.08.12.23.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 23:47:26 -0700 (PDT)
Message-ID: <155cb327-f378-4dc0-8573-b07f8b71dc31@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 12:17:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for eliza platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA0NSBTYWx0ZWRfX58Y57ODyVMYy
 a/q1uU5tm9Ei7XX56IVUSVsoDA9AmZDOcU2x+ynQXEl5SClBiVTQD8xChg34MbvhM2CQ6moPPV5
 f6ZTwPH29zWPAYUs2YShxlMRrG3//WzTRc5iLUTeoU0QvqrGti4DU97TJCZiE07h/XJM5Y+AcMX
 n17qm2HZchTVUlYH5vJUIYeD02lmcNg/wmW3egFRQTXvyakGsTepNuUCOkbVXrkH0//pJ00EQQv
 5eD05xNQ8xB6adYRjrh3zKfq+ra936iLq2kxYKDpLB48dUwxe5jkrJDOMCkcUR3nlOmp+slj5jy
 7JDiZWYRyBtIJLs7D36ztj1r6iuuHpkGpIHlyJpeD0q4FdizXHOH9MlCL90S73PtGA65BkHJhPO
 NIW/QEV8iN+vbui+4uhljmyc+kGL3udR+GCZHu/Mj2SvjzSQg/WbULP//AiQl9RQ7PliCp0kWKY
 UmXaSaxHavZxkAPb71w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA0NSBTYWx0ZWRfX7DsXWavp7wSv
 jdrPAHZN54RjiFnZoBWGeJuBOQ5I2Tcvbm1p6J2towM9uh/qgZvJHjpyINpUaN95E8b/H2b7YNb
 3lrAY7YFqNJ2QYjahlA4nkrrnsimXw0=
X-Proofpoint-ORIG-GUID: XRrME8LUw5cIM-RimrbKLi3dwZfjDv-8
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d6880 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=WWcBhdYIf20_LuyGfbwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: XRrME8LUw5cIM-RimrbKLi3dwZfjDv-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130045

The following changes since commit 9b624be39b464199f21ad642c13c7ab774bc16d0:

   Merge branch 'robot/pr-0-1786556861' into 'main' (2026-08-12 18:21:03 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-eliza

for you to fetch changes up to 7461847fa9f643a061c7b13ab602ac1c41953129:

   qcom: add CDSP firmware for eliza platform (2026-08-13 12:12:29 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add CDSP firmware for eliza platform

  WHENCE                  |   4 ++++
  qcom/eliza/cdsp.mbn     | Bin 0 -> 3645864 bytes
  qcom/eliza/cdsp_dtb.mbn | Bin 0 -> 44856 bytes
  qcom/eliza/cdspr.jsn    |  22 ++++++++++++++++++++++
  4 files changed, 26 insertions(+)
  create mode 100644 qcom/eliza/cdsp.mbn
  create mode 100644 qcom/eliza/cdsp_dtb.mbn
  create mode 100644 qcom/eliza/cdspr.jsn
