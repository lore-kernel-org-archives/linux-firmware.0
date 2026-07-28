Return-Path: <SRS0=80T7=FW=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18984C531F9
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Jul 2026 09:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D50BF1F00A3A; Tue, 28 Jul 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785232586;
	b=KFEf3j4+QbquXE6FidxERlTltInDkxHflsR9RUsiQ4Yiw3ioExIbfhFa4zTY8g/ZKHiH
	 riNjDOIlWMJS/nSbcOt8qeaE5SLNjIlfWDD7NLCnVLMcabXOOKDljIPVn4d+u1wAc8Yw1
	 soKCL7rDAkEqMJF2UQP0/kDu7uet24CyhhQXRKOxA/vvH558Tz5DZsmdk5tNWc+2/g/XZ
	 nP+v8KHHL2wh1wemQA01CGIipSxVDtrEnECPL9srtKNdPf53TQ/wN95QRwZcC6aSATs3F
	 JKzAMBfpjpKPDcDMz4Zv19ATdpotrGuCTbpkndomyjwfWSsGDWpZe+zo5I13atab79w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785232586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZCP+zrwhpjgrV7NFROIJf8NcCNXCQf/IkiJU/gtGXh0=;
	b=Jcjao/46kQWJgtCo8qYQR1ogcZwoxt1+dE+m2+dAWKXj2ibKh7OSx9fIYM6NKxQlDfPg
	 jvc/18HYW8LmOdD01P4VNQpeqeA9e2miihx0P/gncsunZ3UFpUZjfO6a/l+uQddD8Zt5v
	 QCPPlYTHHFl+JLF+FXBND7bPlcVBlWjK/WL3WJfY0H2Jk27BS45aeImDFAhy4MbJR3HkM
	 RM/+oWw4ZZlNfzcY5cHooB5ypyUjzNP9W8rzmngOZICqLZGp3ssGVeFlDwhgfvXHM0TfK
	 SzPfLfy+jcu+j2+nG/k91s5Cd4KEQrO+C0ODXuD/SsPcrdVsZfLTP+96XCD8JzTBnNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K78RaoqB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSLqKwPv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A9B21F000E9
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K78RaoqB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSLqKwPv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2A9B21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82DTA2480145
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZCP+zrwhpjgrV7NFROIJf8
	NcCNXCQf/IkiJU/gtGXh0=; b=K78RaoqB/D6pNtQ/uhnvF/xZE6T1yFe+gd3XLU
	3pHm53a0hqV9iuB47QFc7iJXXhSBOyCMTK1Z30x1YvDRCZCQynlC872BQYL6oGWu
	dTTZRtLT17dvxH39Zv26qk4BpszCNIagBJFiW6OXVNRUG6+HZvsVAfU5t2oSGfzB
	92hOMhCsMrTlA+OxLYWkVVB3X9cegVGcvVjtek9qZ1vdxWOniIQ9W2hTt7l+Nsfs
	tpy0E3J6q7fgHMdq4DikkZUjKMov2V3rvVHgdDPI4TIAHURXrCNLpqQ3csq31YM9
	/BQKyUJLXkUfdzx6atzQ7oIOqNYd5nzECB6HOud+iH5Lnzuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11bga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 09:56:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso6542501a91.0
        for <linux-firmware@kernel.org>; Tue, 28 Jul 2026 02:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232584; x=1785837384; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZCP+zrwhpjgrV7NFROIJf8NcCNXCQf/IkiJU/gtGXh0=;
        b=LSLqKwPvs+O4UzlEG6wMJ6F38D2ZbtZEfMHydQgIRoyZT1Ni2Wlz6ru7LgqlFq+CQj
         +T17KqgkzrB9QQ8uMtdUQU+jwPA5ZnRdDum5FbXaWhYiA0AN57NxynlhZLzxNj9Wzl4J
         +Zr7LpWftzUUCE66Ik8RaiQxYePdwIqYZLyVbJBCVFFbuiGmaeY33hQO2idQ6fYpR+rO
         WyHgiFXBe8bp6hgaJ/VeVo/gbhbzoe9ZL6WO2jtE2hqImqkSSM2Zjr7s8Mz0ybB6vHWP
         uJSp7koiQQbyGV9iBm0cADb/kBdPh+xZm77+MJ91pZMf272T22ISqsOdm8pfMJM8M8PB
         28Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232584; x=1785837384;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCP+zrwhpjgrV7NFROIJf8NcCNXCQf/IkiJU/gtGXh0=;
        b=cKlh9H14yKqWlaPOajql5Sd3PEzLmZ4GuNtArLpa/raWek/jZEN5CrdtaCRNhQ/CE8
         r584s4fkKH7ZjCMiUYM4EXdyN9n7UALlm6Ja8QxVKTt5ZI1SOoqN0VjkgsccjJFhaF48
         hI7JG6oFyHRNlWM75Ox0Y0hDzit92hcAnL/K6Rae3FBdNylDkJ8ILH8wQuH4BYqX8KiS
         3yHTBa7aDi/VhMRibVguad8DpHEsWRc3M6C5CykYrzivGyvuEXwwpeNCry4nD3FStV5H
         x5VT5y7fYNfPZwMibLWHRE62t5sxK3brBNRZO916wZ1WSY0b7nHKot7njg7Vi9kbxAEQ
         RlSA==
X-Gm-Message-State: AOJu0Yyyhtl/FoCq4IObjA8VVMdc06ulcSIgDPMYRupOiXikraXLxyAi
	XQ4tbnX3HYn2Q8sS1OMtOwo7qNuZ2bITjtQgdYXKLfKtET+TvQwu5ltsiHl1/cRAlrGYEI0tAVe
	yuFSZZQ/FiFv3QTdTa5JBFB0UUKtBVWIN+ogQZOnm+JHzTaYCicV1byNQrS0YFKiMzcR+Ddo=
X-Gm-Gg: AR+sD13sPbasj5GvEl3esVzgEBbVxZQDcNCYJ5mtMfNdw2NouuIKAEiPy/lV+oWeLWo
	BtKbjz86vjXDSx4k+wbDBzq+wMKTJOAbvxSWC7SHBX7ujhXGQCHtjkP3BAGkR6MJTFFfjWZhw0c
	1Ozk0+D2rtdrRPjpz1HI336bW783ck/TQ291O24LQXJe9mVlb2cJfQzrAdAW2O4Vok9Rwdrzro+
	74SeC0dj49DQRiYGH8u27roczg98TAGHCnAspHvA2HW/+06n2ntKqs3dvln60UwBnAcFXEjV/hx
	1fPhF6EuT8SPqDAWeFDEQIPxMPuOo28hKr0ba5VqRD/yELluAovNLQDsFuNaMd9A9H0UJKe+COR
	euEhC5aFNsXtfzkynR7bvVtHRcL9w9UnfXw==
X-Received: by 2002:a17:90b:5190:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-38f6a457ca0mr1763696a91.11.1785232584560;
        Tue, 28 Jul 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5190:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-38f6a457ca0mr1763673a91.11.1785232584127;
        Tue, 28 Jul 2026 02:56:24 -0700 (PDT)
Received: from [10.217.93.93] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f08df8a94sm3315598a91.2.2026.07.28.02.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:56:23 -0700 (PDT)
Message-ID: <823efa65-7b21-407a-a1f2-afbf7f38eeb5@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:26:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshk@qti.qualcomm.com, raghukan@qti.qualcomm.com,
        vkasinat@qti.qualcomm.com, rajup@qti.qualcomm.com,
        kbajaj@qti.qualcomm.com, vkraleti@qti.qualcomm.com,
        saddam.patan@oss.qualcomm.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0vmt_wGSgXiX8y55ztxtKVQBcY8zt3rY
X-Proofpoint-ORIG-GUID: 0vmt_wGSgXiX8y55ztxtKVQBcY8zt3rY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX2Auecz6B+57F
 CE7IZZdmAOTbz8p4Cgla92AQcc6vPmqyXklDqyIRxw35Z1pXvKeeI3ASqBq/c1eFI6lLjPQOXaF
 9RfIlM/ovZYawQA0D3f+uq94EfF5GEsCGj75v343jCuQrDK8I8bT6zqLmUssBFxtqcI+0WWVgK1
 xuXr+TV5sOPXSlRq/N8iW/xEVrCsdDQeB0MIRZ9KeqEcQwm9grV96lVaOUbZ9YsGEWkpY0z/nMQ
 +zvrPg+tBETAZH8EwcxY2IgCYFPs2PUfs8P+PDnhhmg1ROnYLWaCrUF4omgTPrTou+gmwgZUcGw
 OX0/B/ZXWIlkdiEp1bFJ8NvU78Bqu61/6CDNuVs/s8fi98rHtNA+EuetbyaEybt1elMJTfcMIeg
 j2JGEZ9RAHwOhGmgSGIe0PsUDYsPj6uYRvzocT/cSFOAW3tARd+M+Ed6ln5vMKp0nJv8ujlQrv3
 D/zZVzX4wXqcGZfSpbw==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a687cc9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=wRNPgEme7tc0AbRQEHgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfXyfL7JydskNPT
 zht+J7CQWdppJo8wYzuIAkdjpyNE/VlzyswuWOuGS4yiEvN/QEW/+qrkF/DAX+bgitlpzmaMSwi
 piyh1Vk33rU3C8PKkeNObkErZNff/L4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:

   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
modem-fw-shikra8

for you to fetch changes up to 70c56065d969614d4fbaf957b8590822daaf32f2:

   qcom: Update qdsp6sw firmware for shikra platform (2026-07-28 
14:11:58 +0530)

----------------------------------------------------------------
Srikanth Katakam (1):
       qcom: Update qdsp6sw firmware for shikra platform

  WHENCE                      |   2 +-
  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
