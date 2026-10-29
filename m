Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83D606A31A
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Oct 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dficKzld;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0GTsed7
Received: by smtp.kernel.org (Postfix)
	id 4D8A01F01828; Thu, 29 Oct 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793264893;
	b=ITNLnmf6dNkcKjS5ujZ7/q2p7SyXU2PGVZWUyiFGY8HjYL09wkIhFKTL8q+hofpNOZdH
	 poYcXM4QFvG0go3QmxiDz4XAuNfcYjG3vufWzjBkK3Qx27dnWGOHOY62FZtmawLlhKvTX
	 +o+nGWbxATyaSJYZWZxtF/PsalFDqlK0nPQVfgOgsc/MJRHvqqnrVEj6uEaNeRl+wu+XV
	 vIzBSJnk7b6OOiOXzF+LscGYyGxra5ZlhpAE+aBNHJkwpwFFS0mtYp8iOB2J9q4w4Fv8h
	 wGaw/3aM0lVD07Pvseoy9vmp2EX8wFEVZeKUx2qNH7jJezFpKByvWAzV/a5XTCZMV+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793264893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gKgRJnM1QPUC1kwOR73FvvdtJATX6L9JgYR0bmwUFGk=;
	b=F451gApjn6VYNkx9K3O8QcncV0/j9jgiLjcvDux6ITJDQ843G9ZM6TFyUQ3BViapQ64A
	 nEgkAjwXGW1KUKAzmMyMiKG9X9l3+3ZqLMzPYEs+Y00R65sxYqoL04SVB0+aqH3hMSzyA
	 mU+P891zZ92Rw2ia/m86uPELgaDG4k56j8nC7j9nshkjqVgKi1RE2VmkVLS1my6V67ZHO
	 qDkJUQdm+tvCzB6/j2OwbnCkC7nPTfPAjx5rgcmFPO0a4rNr7VFchEEuY51LDKrHpCJmt
	 MsrVB2+Qu1TajJJ+MKbBpjZaWIGaIo6rxXRHaMCcYrH17znn2K3u8Udnimri8LHuDZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dficKzld;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0GTsed7;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A55E11F01825
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 09:08:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dficKzld;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0GTsed7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A55E11F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vjwl690583
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 09:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gKgRJnM1QPUC1kwOR73Fvv
	dtJATX6L9JgYR0bmwUFGk=; b=dficKzldcr4vTMyM+yD3Ik4TfmkzAyDwh3G/wm
	I7gTPLbFc/vyDBRNYRIxuL3fprpk5/2TJbProBPwPddSpTH7J2PaxcANdIv1Ia+O
	1YarwaQr6ov+y7a5MwIA0BvBkV7VUQ/EID/Ej435ssgm67vMiPsf+yLw1SxtMaPv
	D/DvNq5DdZT3e+0roJpMQbR/NLF6R03tH6acqAZU1zvyWBXmUnBpIAOjs2AgraYm
	fQy3Mv4IYiJuk0zPzUFamzuMyFjq44W4h32bXyA3jGv2lAHRz9n5PCE8/cdIm9uB
	45ZjdpVSfD7TiEjPZEm3q8//mBWdb+V2p/VT7gUMAyyiqCeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneuu57c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 09:08:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3224023a91.1
        for <linux-firmware@kernel.org>; Thu, 29 Oct 2026 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264891; x=1793869691; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKgRJnM1QPUC1kwOR73FvvdtJATX6L9JgYR0bmwUFGk=;
        b=A0GTsed7w3BNo8zAG9IoNADF0f6Vw+pjturQcCd9nl+UVP/ni+YN8I+RlfbPkpxZHT
         NlVjAVeW5SkdZePp4S7r61n1/KZZhglBdWMZNFiUGKWLRVb4slQUtqEPq7zG6LavkDxN
         DVP17wwMliMYWmwavOMsI69E6sr69L25f6scizWCMXDbzJAeymKOihaG6zvSkN/wJgUg
         uzJxvI9VRVp6jQZWKcfJCuJMWedc7FWe34HrLq7/xU5O1Qc8MhUYUEVeic86cdqkrA/o
         P26n1rTs5cuTCY7tnsibA7W0PNJAW7EGhz1tTzrfEwQBJz1qpT2abdtwF1tTmxtKzMiL
         xvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264891; x=1793869691;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKgRJnM1QPUC1kwOR73FvvdtJATX6L9JgYR0bmwUFGk=;
        b=jedOWVh//GVtNb9+fVg6eXxpMLM2nS9tQQn65Uw9cPIgI+XJFUQ5Lw0HkKPGMuTi/l
         MTKhgr+9o31VfBrhqx0pw+QTyOozS7eigfo0dFCeBihSw+aZ8EZCNM8ys2Ng1xa9EEGd
         nG64jmX4X9s2OMqFCtfxrMYEPQdZW4Knj5XGZaxGA9DgRDpVDDaFmD/jCo2RsGHZMdjn
         H9/+GxyjUV6fDH1yzDb5WZeEPCAJLixXC9bCGbXafhJd8WY+Q1dKMpxqQL25OqxQYiYS
         IqEIvIIO3RJmrjtzAwjtZH2Err6vKVgD/JIUyCxqzKwxN9w+gqNjmsqME6F7DjyUNp+c
         UWig==
X-Gm-Message-State: AFq9FYLt4kuvtuNtiSblG4q7DzjUVdRspFZJLPP5k1T2Z/we2qyTHMkr
	yEACgzZiuYzhb8nPfId0Xvo5DAPm1jnz4rCfnald3mtJR+o3WbGEYwr06HtlzadJ7+7Yj8hvr7x
	iADI0keej2ZlWFJ4CvctmPBFjnsJ32pNcPByaaqw2sYKrFEy93B8YRaHQ+vwN71b4XQlr4V0=
X-Gm-Gg: AYBFou1+XRkTt2z6/PWz1JF0MdmZUgONITJ4p8rXZjVYKQy6SJEFMonNZtf7dYnHpiu
	mmvazbZhB1skqSopKPVpD55PvE9pBJqQnryhIAx845KECjdbEwwGNGIbfxXnw2xS8KX7qNzahTv
	RsAQAGbRPuRBeVJPEkk80rXahC2GE4RGW6jaJSmqchH+5JmpkaA/KpYZDSdxoLt1p/MIxCscKci
	Ae3DeTvq3g0tOdR+v9bbqH/nZOvXOcxGRrrKDGo/fDTbiV0m/+L2LL3fiUbmD1nbS01fJCKHftQ
	u83KJG6EbCIF2jp0Q2rgKfKIilUg8Hc2dvQlBlkwXv3Je4BLiLdQmANFytExKFaphRcmFaN7taB
	PJFOS8IYwWW8O3H/ZOyAjegDrD48SkKKbpKg1DF+ZPzLnevDGQ9KmtZG590CIX8XwLWVdCvNURw
	nwRQ==
X-Received: by 2002:a17:90b:3c8c:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3ae5819eb6fmr3833505a91.19.1793264890898;
        Thu, 29 Oct 2026 02:08:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:3ac:9c37:9418 with SMTP id 98e67ed59e1d1-3ae5819eb6fmr3833492a91.19.1793264890419;
        Thu, 29 Oct 2026 02:08:10 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7dbe1esm3244660a91.5.2026.10.29.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:09 -0700 (PDT)
Message-ID: <df583827-553c-4b19-878a-159cfc887655@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:38:07 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX7WsOFZz4G0Gb
 qZGvyG3pLQYMbO/GV6Tn5pmZKcZiKvtzPMvwWZWfTHunyawI1B5maa9WK4Nwf81vux98GoTac9Z
 kdS7kwOTtQM+kijDmWbya7gNmiK++FL3uXKomb88I9wZIv0uklbKWml9/mvO2ZGksSJ3ekYPJr7
 WeK1AOBizm78eL3+dCP3ze7WYKQuQUQw9y4UsHIvDS1JuQ+dy+T5+u6NXdzoqKvClnyeQebWGZ8
 Gds5DQzIaVzUQ8C5cIk3C7x+vX6xgACNPNI6Jr4JPQkE2XufqxplWuDAxeX5MJfieNSKUipepkl
 aHpIsEI/ZdO4WNOnhXyJxFpq8nlMDiTPWfCHQd7JC5JBDul23as4BsrJD9JpMxm4hE3wP1nWhjR
 GPtuZQQK19CNd1M05lZIUX10q5EQE4XuTY82qJ5Dh8xprFBrHzRFnmQQiusKaHQMOqMsrU/+sr2
 h0sWmPtD5Pg8E/6hUkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfXyA8WfMowQiC6
 bsYmWYyZaxRxiVxdKqFsjMZ9shXj5dXubl4PWy8Odm98+LpBlWPagq0f5z+5VOYmggHlsmC9zsE
 Ib7kjVl7K0xTGXQ6DULSE4NyQiLYzYQ=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae30cfb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=7JfiChwgrRLD9I_c1QIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: NK4_a0hjkwZs2sYekjUoR_L9PvB6QCM5
X-Proofpoint-ORIG-GUID: NK4_a0hjkwZs2sYekjUoR_L9PvB6QCM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,KHOP_DYNAMIC,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit d0039fd797d7776d89f00c22c45754914a96706e:

   Merge branch 'intel/nvl_gsc_108.0.0.1211' into 'main' (2026-10-27 
20:31:20 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
cdsp-qli-fw-shikra

for you to fetch changes up to d0bbfb6d79cb4b8a2f740fce17a0a1978538c146:

   qcom: update CDSP firmware for shikra platform (2026-10-29 14:05:46 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update CDSP firmware for shikra platform

  WHENCE               |   2 +-
  qcom/shikra/cdsp.mbn | Bin 2614680 -> 2921880 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
