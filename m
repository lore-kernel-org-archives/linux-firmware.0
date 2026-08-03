Return-Path: <SRS0=FqRy=F4=oss.qualcomm.com=rajesh.kemisetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3002FC55182
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Aug 2026 17:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 029321F000E9; Mon,  3 Aug 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785777413;
	b=2CeuErIUGm+8L2Qkhzjp4IDAIwdoYTpBOWPT0YYJhQGMSGhlg9tQmq94bdm41gb1wT7k
	 IbfLWGZ3pvA8AqYoj/COHmxjfM7bFCrYwXQy9w2frs/iDu57pfZiqLd6qGUaDJzHeYw7o
	 EqqSUds2XkFbDmiH98bT6KXDYxCwWHilEMEhMS0EEWFYmSf3Jyk0di4qzUzuYScQBOOkM
	 GhdOwhLXzh0wy99b4JlUsr31dKsMR8AGJlEM20iQ/3BwPTM3yGa2FObTy/W87hUlWo0Du
	 yyFIlZ3u4LwdL2yCif4iLs+R2MECgLvo15UZxSKuAka9pRXIuDNUztLL6npZ7LiUHVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785777413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bh86TTB389hwD5JbCkHoG86iQJpgt03p8oHVIzMMmXw=;
	b=aIhnuF1VaxtWvBJvhOTKOImoyV89D/fp2usY8DI2uiH7L0b6avZGWE+ksJ0sY92xuYu4
	 R6UFMBDkMr8mLeVifzY3oHudehQHXhM+Np9Y6wvlXNEJaqWBIVM/jCOuHYt1x0gjgQNVw
	 nn3UEPiJfcp4eCiwE2MQUjgjC4WLctpe/WHXMTAF/xnpc1zza/D9icuoUKMJxO9h2f1CJ
	 I+OFkE6TrGctZh87jTbKgMz8eZUjDrxGDQln6N79V47vcSyb7s6GWyWp2eHiR4Gsp4VPt
	 aExpHEiwxSXvoWFOH0AxxPI5VmcvRBnaVDntGTETNSYmGoiNvhJcasadb/N8mfUI5qA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QIJ0iUio;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aL8+X3k7;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32DF91F00A3A
	for <linux-firmware@kernel.org>; Mon,  3 Aug 2026 17:16:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QIJ0iUio;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aL8+X3k7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 32DF91F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H7Ha01535996
	for <linux-firmware@kernel.org>; Mon, 3 Aug 2026 17:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bh86TTB389hwD5JbCkHoG8
	6iQJpgt03p8oHVIzMMmXw=; b=QIJ0iUiojDlaTFZpMt0wQhUYl4L9GFGhbm2i94
	COMCFIG+l0q+fqcDlZMQZAYM492+rV/Ckvh3UYd8MPaBLdJblZFw2f29t0YeBqcG
	068l/sTs3NTu9orR1QWbJnpWxWULIZ3pxNcSktn+9nIu7URoPRd1YYpM7zJwNm6S
	A3YM1yMI9VvTUSoRLeLOvB3vRiffDUEZOv7lisuri1VnWzQY3lOmGLxVUH9ZLVmJ
	lPxpDPqGINupIix6NYAmYpd7ZJu0u05diupk/n9OgPtwQAG5eVKH1P3A9A8nzdQH
	yWZ7UbmOlmqXBmcsgSlF5cwh2fqYXsyCQbxB13RSw+lB1sFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sg1df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 17:16:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so6093674a12.3
        for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 10:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785777411; x=1786382211; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bh86TTB389hwD5JbCkHoG86iQJpgt03p8oHVIzMMmXw=;
        b=aL8+X3k7SZUe4akDT/1dqwJ5giFDrJ5vcaEW/r10EpFum8fBUjfi+T59mzRADoPbrs
         3OC8ltCyZG5e0NNr+YWicTj5xGmGfIxNMHbvyNQJ3yNIfmPpzgDtrJAloewWZPg/6Bqs
         1VX/q+BYmwQbMnYElhuHLhC/egDn7U3/Baaa4oABZ6YjIbiSIe6v/6rfTQxYXltrDxPf
         WugO2wAwrl10QJnjb/TAuEpunvpK0ROoT4s2UThMd0PsIw8o+PQ/WidSrfv8XeldNBC0
         v+4mIu/1Bsp60vPH9yaHxMGTE2G8EdZPp1hWhIEx5Bs6OlaV9om532O0d1hR7E0fGWrb
         KlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777411; x=1786382211;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh86TTB389hwD5JbCkHoG86iQJpgt03p8oHVIzMMmXw=;
        b=jB7DGryjL7jo5QN03r4Ap1mnJQmhcI/HquQOKIbDPW6Xj+WoCR4rqA5yOvr+V39CHT
         1rIvo+CKJx5VJ6YSKPSVVluNKw9YLVSJyLBCdDygUTfdaXVzMCMcziOB+Teu5oBXyCez
         cKCZHujzH6554jO4ge8BgJSlarQAGo/nK/m48g/H34J9zYkrW5qv+UvtBJAKuBAEvEBF
         9kkIhxGP8pQGSrhC6HU3Qun8RO2nEAeqxwAdD0+T7xYEEaujrvJxhOSdkrLt+DFAVxxD
         DcrQkJgasDQZNOduF5n2uQ3TVmyi1PAvGDgrLsFtD2LAmoHXwNTwx2rAQ8Yk7s7RWEPH
         KSdA==
X-Gm-Message-State: AOJu0YwJlq7S0eK+sQc2irBzVu+cQj6y1hSyvojfDUqgnnHq0ttnWPzI
	rzlzu6884sasAexL/DZ4YBbG2mkytBvmTsnuwgAsJVpH9CCJ0+UFl2HFfENxMLNKZofwwJrsPIW
	Wc4aZYqU+WJ5/Neb2HQ+V/sktbUtnOCGTo+Q15qlMvSfOFcfXuQCfiEMiKkJOTwmwvEY3fig=
X-Gm-Gg: AR+sD10xmkcEfFsMl6TKEM3JvbdYDZZqcYuE1PV3JTS5JXZYH981rRjhHweXXxaEnDU
	ok/l+uzw2iLcyVrjZr2GauO9WLdMil3Dnjq3PCXhUThJOF9IgOMc9GQS3vvmfK7ZD1jEedGLCX0
	TQth79Nly+OdnEABM+EA1JSV4Kcd63MnyLCELYkD/TpmeEDyR1EwpKCLt82J6fSN1KCP0MQh2sJ
	czdERW6z9PCe3CUpH5BA78Pd5N8WLRcm9IxPNrtp1apQn9zj2vJVKEgxbkbYEzoHyc768O4bHQ4
	8/ReCjxOpUzKz5hNe+PDRslOI8d/jDbqFKlxXareTEpfdzHNsT8dc6lapKR0n3kW+kAmi0sBqrJ
	pCQlctnjuAkjgjWb5TgXmmlkqN7d23NHmLWuZ
X-Received: by 2002:a05:6a20:93a1:b0:3c3:83e6:c6e2 with SMTP id adf61e73a8af0-3c92a88906bmr10648339637.50.1785777411037;
        Mon, 03 Aug 2026 10:16:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:93a1:b0:3c3:83e6:c6e2 with SMTP id adf61e73a8af0-3c92a88906bmr10648318637.50.1785777410657;
        Mon, 03 Aug 2026 10:16:50 -0700 (PDT)
Received: from [192.168.1.37] ([183.83.143.144])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm41329268eec.6.2026.08.03.10.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 10:16:50 -0700 (PDT)
Message-ID: <fe4cf09c-4ffc-49d1-adc8-52dc39ae8a0d@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 22:46:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
From: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for Eliza chipset
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE1NCBTYWx0ZWRfX37RKCx/LQsL/
 mZyUXS+dTNDoJ3I42xMzKAWQ0853OutfbggxfQBEP6DuOrtlRS/Tq2LRJ1vbGMactdQ+ZrdQ98G
 0HqPkKaggbEnKVuGpMsL35N/xr0kz/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE1NCBTYWx0ZWRfX2Y0RE2Y++hAD
 4rG7MD1ikWyuqE20AjDAtrZ/NbfNKyxeDOE6Dysfir20iWvqUZ7itJvA58Y5LcjCehhwGWP8O+0
 //p0ju2KHxliW+bNZO5tsUUwRmhzb6X4o6Nw6RZIwElVxiSECvHhBtLinJQu3BnQAr/n7Yrx0j+
 SdfaBx7+rUMGF3yV0cUBDxer5t/7qe82UPDzw4rKLiiNviuU0Vdt9wcbv8v3K6QOKydORcprGGa
 ECgJmomgz5SOTB4uBztWSpB1y+M7qNyV7jbZAxi/e7KNMB88VLoP+vGNDrjCi+J0M+WYnKAIQeX
 jAY8fjadzvutg3P8GpolNxKQ6cg4w/cm0sWuZSXRLF8h/dMlanRZEihXC2fExZiFdism8ljIZmR
 dtWPDLeKBHjciiHQalDCTPEH0hMid9fhloFdN0zAuwwSst2h1NtyfyyUXUnRZyj7hRCFAxY+Zad
 wOjrrwF1SniHl9QMvsA==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70cd04 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=cg5/Fp8oj4J3LO2KKLl7LA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=qqNsjqNcLuWtFPP-EkEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: IN3w8eu0DFzJUrbO4ncFSX_ZSUD4cVVR
X-Proofpoint-GUID: IN3w8eu0DFzJUrbO4ncFSX_ZSUD4cVVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030154

Hi,

Please pull the gpu firmwares required for Qualcomm's Eliza chipset.

-Rajesh

---
The following changes since commit a968c5c2962e0bad2482f4b05a3fb627b871ca89:

   Merge branch 'robot/pr-0-1785507100' into 'main' (2026-07-31 15:41:24 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-aug-3

for you to fetch changes up to 68e5d7dc9f410f8e4bd55d76545dd07878c6dc7c:

   qcom: Add gpu firmwares for Eliza chipset (2026-08-03 22:26:33 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (1):
       qcom: Add gpu firmwares for Eliza chipset

  WHENCE                      |   6 ++++++
  qcom/eliza/gen71700_zap.mbn | Bin 0 -> 12088 bytes
  qcom/gen71700_gmu.bin       | Bin 0 -> 81348 bytes
  qcom/gen71700_sqe.fw        | Bin 0 -> 37044 bytes
  4 files changed, 6 insertions(+)
  create mode 100644 qcom/eliza/gen71700_zap.mbn
  create mode 100644 qcom/gen71700_gmu.bin
  create mode 100644 qcom/gen71700_sqe.fw

