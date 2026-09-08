Return-Path: <SRS0=4iRv=HA=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F97C79FA1
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Sep 2026 11:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB1691F00A3D; Tue,  8 Sep 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788865751;
	b=hViP7NOh18wUVtR4JWXxDsuwH78FFv2vilL2NNmXa1PvF1PjTWKMqNWjigYr7MeKmC9A
	 p6hjIio2EUtW8X6NdfRxv7upXRb9Y7VZ8oHUGQN5BBkLROXaBxt2BlZqeZ+GbgyVlKXU6
	 ddRj2GJzQpnX6M5XuuAFOzpnMIOZL9gZyhQA4rJUhsbGMyuCf6JS5FMtmXWj/acgnLUaO
	 xm9ng7KUAcwukUTn0X4uqgbUJjrJlc9KTu4HkiX6Uvi0Yb0MuY2sQtpS+ObPPDcJAgP7F
	 2L1GDGWu+EQm5TlLDwDzVou1bCtTEml4ECPrcqQZoTE7iznyz51dbTyuwfHjSoBOGnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788865751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TUAPS2Bc9nW8j7EV8DkwUN4Rhq6yA3XFnwSi+SfBZK4=;
	b=NwaAMaoGVEoctXroln0C8I9wcSroQ4isbGDS0asUpHh3ugFov/GLPzpjkY1lF8+37vz3
	 Z2mTMdgJq2D4u9vXet4aWL9KhbA+zMK5UnEAfDy/+nLPHNaoPNEIrOyNPVshrAVcruQhb
	 SVYrLLa7SJxWOEZ1C9GV//4iKv6rrQDRxjm0hZWL5n2gj3rvsq+3DlVRfbKh0U4cgrfGF
	 MitZW4TsZmH3+9KNrV69EdA1kUwpCSOsf7pJ8Xtb6Q2s5LIPb6bcugQS6rdU/ZINw65HK
	 IoZaZfb4jgagHmpVmDr+ZR7JPYHFzqUNhhYEofwQmSXgFAZfXwMr7F5xwjv5t5Bx63w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ba9wimJn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9J6QzXM;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 231AB1F00A3A
	for <linux-firmware@kernel.org>; Tue,  8 Sep 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ba9wimJn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9J6QzXM
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 231AB1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADO8G2005685
	for <linux-firmware@kernel.org>; Tue, 8 Sep 2026 11:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TUAPS2Bc9nW8j7EV8DkwUN
	4Rhq6yA3XFnwSi+SfBZK4=; b=ba9wimJnbNUU5n5qc2dGjvmyx3TTeXTkpfE1aK
	Tht2xzeq7IwGKuouXU9QaDtpXBlLyNZjbwPuElYJeSOIt/wbI7le7YzpS3LYmC2A
	3PRFzxGAeHfs8P79oIx0S+0vD3A94qtXiL+WkhFN6OrucRRXwoiihx9AXJSX76JC
	uV7v2y6PfhK2+arI/KbiKRmdIyJeMOYjE+lXHCvPKzFhIP5qh9eOsQXWwgV9+gxu
	d47JBv2Jo6gnKomQucKItJ+azS4ST41N9VsIr1nhLVA6wrUFYL06zDGADbbAJxJY
	0F18ksg62yI+ny11CaLe3SFLVS2YdgHilmaKe/1zJ8HLjNUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjhnvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 08 Sep 2026 11:09:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso1569687a12.3
        for <linux-firmware@kernel.org>; Tue, 08 Sep 2026 04:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788865750; x=1789470550; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUAPS2Bc9nW8j7EV8DkwUN4Rhq6yA3XFnwSi+SfBZK4=;
        b=D9J6QzXMmTS+TQdEsZFdIYwgX24S6C1G/GLwT3PLMWGluG400w32yuu5crcHT0jkRa
         mpQ1+v5eyLa7zEuUx0SxyFUTzWxN1VDGmlKmbxDBWVsWTe9cf3YpGiR8piu/tttrMu4f
         0LhuskXNZezDHwkj/4h6oXvz3xwNXQ3+4Xj6t4wuwYRuiiAofd4ku9LYVMym+7I0WT5+
         2AqYX2Iv58Srm+aLZ2ZHPhckJ52b840wUIpkkbfeWXrZtWyj9ab7ag1MW13GvPwPnvbL
         impFj0GD40mPs2DzrwVK9kwB7oc57ynCwCssTDPV/5HIOaIqFfDiqYk1XHw1CxmzN4dQ
         UNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865750; x=1789470550;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUAPS2Bc9nW8j7EV8DkwUN4Rhq6yA3XFnwSi+SfBZK4=;
        b=Yl7JNl3Hujr4tEr/HzVXDpx7kGE2t3Z7bon8CqTNPvJmxWPDIGfwTF8Zupwb+hfbCP
         n+09C0FMVNr+xbJXb1gQKaETGMhR05Gb6FTK04z2uKzWpJ/16vZibKzcymDHCeBZf+lr
         JyrLw5edXIMGrnYsJXRnU/Z0sl//ffVgCgI5dtbvPIlhefu33wVFNdwOodG5lC583oFU
         VB+lm/qbRbh4by93zNIuWmRo8AHjdCpMCT0w3M8TNcyBoCkUgkn1bW29vqZO8LujH2Wu
         zTbSXXYvm7MDbBhgJMo8nysFYGJchOIvet0YVvDglgPRZd2jr3kh0ozBp3Q/Qp4Vj24L
         fvkA==
X-Forwarded-Encrypted: i=1; AKwUvBwjiMRUVYhL/2ezerGltLAiolOZ/lHWBSx2GIAk67TBwlVnGU79KidyDz4l2E/SWXKmoKH0igfvXNjC9L8y7Q==@kernel.org
X-Gm-Message-State: AFuF++nil3MSv/oVwtBjlSgcon9szR65qFXNMJWxi575yeZjyqCKPuPb
	OVrCwgXFYAfu5lNj6xXgmcQss5G8mJ+DIHyI3nKDQuU9OdzyU0Ak+YQxXAycgsdOInClzcBtMvT
	bVb8NsLCtTUSIfgc68zuAaDzqp0zgQm9Atu28u9js8Y39XCmcP+LM9KiIQlceBqW/YS4iV+Q=
X-Gm-Gg: AYBFou1JkwHCZs8ppGpdisgQ8C8ca84kLrQB/E5/XbY/kZhuekFS07Ih1lWeFnMKVjB
	/2YRqIVuoX3azh33aLwHJWw0FuVFgyyk5hxGmB8GexqcYZlEAY/COEEWr0I63hDoPDm0bOxFPXp
	Dp5OBqPOzghmyFXstlXNq/S0dFNWZbp7HwzsTOp4YsVyx/HMAiLMgq3/bBbhIRlqbwRRa/Z/5RA
	mGIB1ZLzEKCgNAUoio9eZDf95ix858/6Ki0+uoeKgyi3kpegzreDuZlDIhs6tUldYbqbahqdJpq
	tgeilEXJSkUWIGI97mrHikj4pqgFqmtVVlyD3AvvQXioXzr1USlEy00e06uCFhGTxF7L9q0LnyQ
	H4Lqf9jEZEqxNeaIHmMf4i5BpXPvuSo1tlEZM8hlShvekMiZaEpoCPzghK+nApEc=
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr43937705a91.7.1788865749550;
        Tue, 08 Sep 2026 04:09:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr43937643a91.7.1788865748992;
        Tue, 08 Sep 2026 04:09:08 -0700 (PDT)
Received: from ?IPV6:2401:4900:889d:45d2:506:184a:9f1:c95e? ([2401:4900:889d:45d2:506:184a:9f1:c95e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm40093589eec.1.2026.09.08.04.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:09:08 -0700 (PDT)
Message-ID: <bcf8eae6-b138-4d00-91f0-3cf3c849bab7@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:39:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExOCBTYWx0ZWRfX5PeAPw2dFKnp
 Y6T8xuewMO9ecnOllT1+8z6181VC/LnfD8QuatLouFgmQokydhfVWmyiZV7dl9QMvA7qWeaRFXo
 1rTdcS8OmcRRGlpyDJBQjMSDdWWpNM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExOCBTYWx0ZWRfX+CXC9doDl5AM
 qu2PKNmjkE1OXdH9kowQ+u12zITB6Nu+SXYc1iWBeTNZIT0MyVDJWKzHelFrLUQrtL4gYBT3Id6
 jMDhgdPffKJ2LlpuOsgAwont1T0HdVNA64WW++8iWUFKA3rXEhNi51E6gxHea0eqCq/xooDabbw
 WynfLWUhvhkqFWPpo9hrmP8p6dfKZb5Mzw4eKH7yG+EWDt/0LjYSuif+ebmFqbRIfpBQ6aEkD48
 1HvWF3UxiQkEIblWZ8yMCNhGgCT/2iRSKmw174TP8R7WijimnwaPlbi9qxTf8hDHiBaijifTNF/
 njU0vRoHeVTEJaKTzISy5OSUVPZMBHHXlR6HsINIuo/iUqPsLUi6GvRUGdbwxDalX2Xn4mSMRzY
 haG17ECd4n0+bqwb1g4s/RRe1+9S4FmH0e2DTe4uHGwig6VywY0r/P/q6pTBoBFSG1mnV+BX+cl
 lVSuyzqgQNJf0E5Bjhg==
X-Proofpoint-ORIG-GUID: pfsCY6sTcSmGJjfrFaFzQWS3a7nVQ9vT
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fecd6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: pfsCY6sTcSmGJjfrFaFzQWS3a7nVQ9vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080118

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-talos_84_1

for you to fetch changes up to 6c08d389b7de722804781d0e382552d1c7a8373d:

   qcom: update ADSP firmware for qcs615 platform (2026-09-08 16:35:39 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for qcs615 platform

  WHENCE               |   2 +-
  qcom/qcs615/adsp.mbn | Bin 8532108 -> 8659084 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
