import mill._, scalalib._

import $file.lib.SpinalHDL.build
import lib.SpinalHDL.build.{core => spinalCore}
import lib.SpinalHDL.build.{lib => spinalLib}
import lib.SpinalHDL.build.{idslplugin => spinalIdslplugin}

val spinalVersion = "dev"
val scalaVers = "2.12.18"

object projectname extends SbtModule {
  def scalaVersion = scalaVers
  override def millSourcePath = os.pwd
  def sources = T.sources(
    millSourcePath / "hw" / "spinal"
  )

  def idslplugin = spinalIdslplugin(scalaVers)
  def moduleDeps = Seq(
    spinalCore(scalaVers),
    spinalLib(scalaVers),
    idslplugin
  )
  def scalacOptions = super.scalacOptions() ++ idslplugin.pluginOptions()
}
