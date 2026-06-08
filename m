Return-Path: <SRS0=Y/S5=EE=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B09DCD6E79
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jun 2026 03:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 674C71F00898; Mon,  8 Jun 2026 03:58:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780891130;
	b=ON71i522K8adwhj+8EH83DJ/F6Es9+DKdtw5J99hVLMxGyFbPC1VQCINhEmjoQtcBHHD
	 RC9SizHqbO5TMVfZcn9jmQ4FydA0uoMIo7YlAlL9x5sDtrUm5hM4clbhF+vaVsm6QdqqS
	 xeyMLH3E4ljjfezGD+kkhvTytT2UXlGohR9QLfnSu1HtFB8FTRP9NGaBUsYvnEavybhsj
	 txxRjA0M4ZD4iC8wfbgZtWtT8qOHrrtL6u5TeIfKiE30pyEajnk4YxDutIcS3VPELakNU
	 QxNA+Hc8oramK7VaC5cYEC5nyXlzl8HcLk70VjRBrEyLzlOgmd+66sUrx5wIB7JjExw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780891130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4eaHkpB5LJtRWaHnqnQcry3EhMNKPpd84ggE0mzOXnI=;
	b=elXfPRF5ztXYGKp/zDEg0he1dRx5pQhN0a2LY/TpAKHsHkG4XLWRNF/UsF/gGhxLMtEq
	 83kXHfrGQSOZHDWVaSzzZ12HoDS+bSnoJaNiImUlDUkofKgyqWqUaMetAZSJ22po5bezI
	 bZDSaFG8j6kRvqmCThlyBEtppXnj+hALooSlSnQq9n/+sKfqgqx4A03gyPqJWeYsD3LFj
	 AeS/MSxsFwaytnH+Grw+MZ6q4UAM3BcT18P6qWg0lIqtesCDg1sobt4UIuOl+FmNIlwAG
	 aLKabiaV0mRXMsf96RzWkjDYYdB7PfNuafR7P///9YcljVT0DrcYjbsu1RbAyQqt+SA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A7pqXrib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hW5whp56;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C68D21F00893
	for <linux-firmware@kernel.org>; Mon,  8 Jun 2026 03:58:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A7pqXrib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hW5whp56
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C68D21F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F3lP1471433
	for <linux-firmware@kernel.org>; Mon, 8 Jun 2026 03:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4eaHkpB5LJtRWaHnqnQcry
	3EhMNKPpd84ggE0mzOXnI=; b=A7pqXrib0xA9uWEjK8fvVrzYHwR7TR4KeGqzJz
	tCPLeZjo7jrDbh1gyGyUmoGwh10ubHJtXCLkfK0i4S29x9K05Jn43fU/QizTCFDT
	EUyGQuq0ZZODdLjIcYw9Xz/DVFO4tW0QoVFhQWJFjnVoZaeqPt6QTx0Yn25HKNyx
	F3YQzKcG8IJ9dgsIu8HP7I8h3NPpdPMLpYbceT+fehDqIbxCx9cDg0b6/BAcwDYo
	OIJWTKN4VfgbSnhH3VzHhaZb4bHM5qDp5eTAXG+Usw38IdZFo2coU1MPtBoGbbKq
	PlRuIoK901hEKUSpiTcBRQUlUzhrBcbGUWzhX9RwhRkgOc2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwdf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 08 Jun 2026 03:58:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so2292057a91.1
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780891128; x=1781495928; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eaHkpB5LJtRWaHnqnQcry3EhMNKPpd84ggE0mzOXnI=;
        b=hW5whp56UtjFcmoZYsOpsZVQFbr1sSVeBOmt6Ny1GKyx5P9ARX9aGiIvs5bTOszGfi
         xvkTarGIPaEYXbLlJXTze1ITBiKSHYDj/8NI3f8SP7dEk50Jxa1RK1x+iQPohuwYvH0K
         hAgKwdRAkyQXwwTniO3s6+Zny1R2AlbpqB6gQl7fyD6tRLZApkAlCK66SMkq/k05rMHB
         lsms22ueUB7rcGZzxQuVvJzfem9I4Cne2nwYNVyCzX53ptL3j0UzmA4q7VDgcEgvZcKz
         OJ4GmLAXqwjmoxdr/ZO6s2lzF/pzSqq9PMli7qcdG4WedlsEt/toT9T6zIrzw0tMdBgN
         cKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780891128; x=1781495928;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eaHkpB5LJtRWaHnqnQcry3EhMNKPpd84ggE0mzOXnI=;
        b=fnSV/Cdz2tMHDhpPt/aNm/kO9z3GyioQ+6nYlcFCN05TB4drPexj96D4PlV3LQlfSE
         Iqja7muRYeOcCCJmlcvfynlS83UNo3btHLGg7VwLyrJIjTz6Upk1f+058mxJuDMvQ2Uy
         NBFBNSlAFu1/s+wqPL/Udi2azT/1T7Fu55cVMeLhofRkiB/XQs2YcCuQVGiI/WGhrMvv
         ef9ekgECHjm3+GXdxNWCdnhc+QjlzMeblz2PuJgWWyroyWVqXb416N4ECUEgpU+G9oZ1
         zTAX2ETRJ0ZmoLofXpT5FtcIvrurRfpeOIsMO4UOmqSYaR8R/w3DQW3EP5N75W/G2/DO
         8kZw==
X-Gm-Message-State: AOJu0YwhxqMLucz8oHtOlKg7DgJv7K0IlBEuj3Ag01pRYB0GiFB6skgH
	SfKhdcSoTHwyecrz51uQjEEJG+qg5dtlfS3j1gcz+x96yp9sHPFF2K0GzFW/SqZ0B6DwGms9vHW
	TWYDzu5wOfpNgVlJdsyfhrA5ES1gV5uCmXME2pMjWVygNOy5C+7fuvAb3gLgYyw7DnjL3h78=
X-Gm-Gg: Acq92OGNB2pQaFyzVmCq36vb2K7VmUwv6ZQfLoU/fXDDXcZHJHhFAO2C66IGQAf7/QB
	Z1q9hm3u30fY86ag4KsTKY7mf4WSGEFhTpZA8J3MbruF3Lw8QP10WTVuuJyUANa1/S18xJEUtC9
	h9NZFbyRCAJdacWYmho9a5p2Qrysv/x2TLOOMIuJ1YwmTAksb4OokR3RGehc2YB9Qv2VxB5VmC8
	pc+h6gwJbyD6sanqPftT8Qlg3lu7FDKfqntdniM2ajY1+/CK1B+vdmfQ3YJEaV/pvH5LIsqauT4
	DJIXLov1TkyslcpKiGPJtzsgrBSzzfwoesbWnpk8AOCyndPDIuTd61v7GJigA25r6GHlVvDJlN1
	rUQeNFf/cXbEtVfq1xgOMmxHRQxxH64a3mk562E0G7mdwDKsxFoZNbSQSQ0fB
X-Received: by 2002:a17:90b:48ce:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-370f0678f09mr16110235a91.15.1780891127850;
        Sun, 07 Jun 2026 20:58:47 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-370f0678f09mr16110214a91.15.1780891127343;
        Sun, 07 Jun 2026 20:58:47 -0700 (PDT)
Received: from [10.204.86.57] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm13477746a12.12.2026.06.07.20.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 20:58:47 -0700 (PDT)
Message-ID: <a8c67889-2c23-45fd-81a4-e5a6c776771b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:28:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a263df8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=qBBv3P8nucFailthiGIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: _HExVFaDbqnkNj9A5X3WO8KuElu6yuV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzMiBTYWx0ZWRfXwRAdDf9BbG4H
 D3k/nCZa1Ug/1bMj23ctw7tQp26+Low89OfI34KnJnd17aiEy80g1BuXUQhwUOICzn/B6kSJl8m
 svPDe1vaTPdRWa//2ToKLWm4eYkjrJR+/ZyC8DTT8YIODM+anZ/dIrR6g9mK1OoX2dBqC7q5yC6
 +7Z5jT2mGf2i25biougC8wxYdhX3s1dVvlxbQ8yso9bdIcFFdc+hIBROaEsvkK1Wbfq8UDEhYMX
 7gZhN3jx1ZDcqxcCWTKkkfwHOuo3PQNy+VQt6ox4cL+9wTCqCFc/pPSPraRMNBfYgclnqCaOOqB
 k9D14TcVb0Ket0EffVpUwUfS8cFa5+DyOLXBWWfWwFdTi+FXfrroDevY05TUlIlq9ha9MIvVpUq
 nE/pa5DYRQzlHZX8aBw3CFAiFa3iA6dHlY0zNmIqDff7w3X++91PiFNhjVOXD2NVcoknPiRfyjy
 rl3HqUusOUT8NjllgaQ==
X-Proofpoint-ORIG-GUID: _HExVFaDbqnkNj9A5X3WO8KuElu6yuV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080032

The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:

   Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-monaco

for you to fetch changes up to 331ec9dad02591b7a9d9cf059b1f2573dd117f65:

   qcom: Update DSP firmware for qcs8300 platform (2026-06-08 09:25:04 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6799360 -> 6803456 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3174400 -> 3178496 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5992448 -> 5996544 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)
