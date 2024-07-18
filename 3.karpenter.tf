################################################################################
# Karpenter Module
################################################################################

module "karpenter" {
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "20.19.0"

  cluster_name = module.eks.cluster_name

  enable_pod_identity             = true
  create_pod_identity_association = true

  # Used to attach additional IAM policies to the Karpenter node IAM role
  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tags = local.tags
}